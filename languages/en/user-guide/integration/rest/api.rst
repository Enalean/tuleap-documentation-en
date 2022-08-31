Various examples
================

In this section you will find usage examples of Tuleap REST routes.

POST /artifacts
---------------

.. NOTE::

  "values" sent are the same for POST /artifacts and PUT artifacts/{id}

With some artifact typed links
``````````````````````````````

::

    {
      "tracker": {
        "id": 81
      },
      "values": [
        {
          "field_id": 1796,
          "value": "test"
        },
        {
          "field_id": 1809,
          "links": [
            {"id": 122, "type": "_is_child"},
            {"id": 123, "type": "custom"}
          ]
        }
      ]
    }


With a step definitions field
`````````````````````````````

The steps are ordered according the rank field.
A step can be added or removed by adding or removing an entry in the ``value`` array.

::

    {
      "tracker": {
        "id": 81
      },
      "values": [
        [
          {
            "field_id": 10162,
            "type": "ttmstepdef",
            "label": "steps",
            "value": [
              {
                "description": "Click on the link",
                "description_format": "commonmark",
                "expected_results": "The page should open",
                "expected_results_format": "commonmark",
                "rank": 1
              },
              {
                "description": "Search for the image on the page",
                "description_format": "commonmark",
                "expected_results": "An image is present on the page",
                "expected_results_format": "commonmark",
                "rank": 2
              }
            ]
          }
        ],
      ]
    }


Retrieve artifact attachment
----------------------------

The following javascript snippet shows how we can retrieve the content of an
artifact, find a suitable file field and retrieve its first attachment. Assuming
that the file is an image, this can be run in the console of a web browser
like Chrome or Firefox (don't forget to change the tuleap base url, artifact id, and
access key).

.. code-block:: javascript

    (() => {
        const tuleap_base_url = "https://tuleap.example.com/api/v1";
        const artifact_id = 1;
        const access_key = "tlp-k1-22.3329b8ac4401eaf03cf7776d6bab1809883624eef7a2e2dd2dc4d07696d32504";

        async function getArtifact(artifact_id) {
            console.log(`getArtifact (artifact_id = ${artifact_id})`);
            const response = await fetch(encodeURI(`${tuleap_base_url}/artifacts/${artifact_id}`), {
                method: "GET",
                headers: new Headers({
                    "Content-type": "application/json",
                    "X-Auth-AccessKey": access_key,
                }),
                mode: "cors",
            });
            return response.json();
        }

        const fileHasAnAttachment = (field) => field.file_descriptions.length > 0;

        const isValidFileField = (field) => field.type === "file" && fileHasAnAttachment(field);

        const findFirstValidFileField = (artifact) => artifact.values.find(isValidFileField);

        function getFirstFileHTMLURL(artifact) {
            console.log({ artifact });
            const field = findFirstValidFileField(artifact);
            if (typeof field === "undefined") {
                throw new Error(
                    "There are no attachments on this artifact (or you don't have permission to read them)."
                );
            }
            return field.file_descriptions[0].html_url;
        }

        function saveTheFileSomewhere(file_html_url) {
            // For the example, instead of saving the file on disk, we display it in the browser
            const img = new Image();
            img.src = file_html_url;

            console.log("Attaching the image element at the end of the body");
            document.body.appendChild(img);
        }

        async function downloadImage() {
            const artifact = await getArtifact(artifact_id).then((json) => {
                if ("error" in json) {
                    const error_message = json.error.message;
                    throw new Error("Could not get the artifact: " + error_message);
                }
                return json;
            });
            const file_html_url = getFirstFileHTMLURL(artifact);
            saveTheFileSomewhere(file_html_url);
            console.log("done");
        }

        downloadImage();
    })();

Upload a file as an Artifact attachment
---------------------------------------

The following TypeScript snippet shows how to upload a file with :ref:`TUS <rest-api-tus>` as an Artifact attachment. This will replace the existing file attachment if there is one. If you wish to preserve existing attachments, you need to add all previous file ids in the payload::

  values: [{ field_id: 112, value: [<... existing file ids>, <new file id>] }]

Don't forget to change the tuleap base URL, artifact id, field id and access key accordingly.

.. code-block:: typescript

  import * as tusJsClient from "tus-js-client";

  const tuleap_base_url = "https://tuleap.example.com";
  const artifact_id = 1;
  const field_id = 112;
  const access_key = "tlp-k1-22.3329b8ac4401eaf03cf7776d6bab1809883624eef7a2e2dd2dc4d07696d32504";

  type PostFileRequest = {
      readonly name: string;
      readonly file_size: number;
      readonly file_type: string;
  };

  type PostFileResponse = {
      readonly id: number;
      readonly download_href: string;
      readonly upload_href: string;
  };

  type ErrorResponse = {
      readonly error: {
          readonly message: string;
      };
  };

  type FileUploaded = {
      readonly file_id: number;
  };

  type AttachFileRequest = {
      readonly artifact_id: number;
      readonly field_id: number;
      readonly file_id: number;
  };

  async function createFile(
      field_id: number,
      file: PostFileRequest
  ): Promise<PostFileResponse | ErrorResponse> {
      const response = await fetch(
          encodeURI(`${tuleap_base_url}/api/v1/tracker_fields/${field_id}/files`),
          {
              method: "POST",
              headers: new Headers({
                  "Content-type": "application/json",
                  "X-Auth-AccessKey": access_key
              }),
              mode: "cors",
              body: JSON.stringify(file)
          }
      );
      return response.json();
  }

  function uploadWithTUS(
      created_file: PostFileResponse,
      file: File
  ): Promise<FileUploaded> {
      const upload_url = new URL(created_file.upload_href, tuleap_base_url);

      return new Promise<FileUploaded>((resolve, reject) => {
          const uploader = new tusJsClient.Upload(file, {
              uploadUrl: upload_url.href,
              headers: { "X-Auth-AccessKey": access_key },
              onError: (error): void => {
                  reject(error);
              },
              onSuccess: (): void => {
                  resolve({ file_id: created_file.id });
              }
          });
          uploader.start();
      });
  }

  async function attachFileToArtifact(
      request: AttachFileRequest
  ): Promise<undefined | ErrorResponse> {
      const response = await fetch(
          encodeURI(`${tuleap_base_url}/api/v1/artifacts/${request.artifact_id}`),
          {
              method: "PUT",
              headers: new Headers({
                  "Content-type": "application/json",
                  "X-Auth-AccessKey": access_key
              }),
              mode: "cors",
              body: JSON.stringify({
                  values: [
                      { field_id: request.field_id, value: [request.file_id] }
                  ]
              })
          }
      );
      return response.json();
  }

  function getFileFromInput(): File {
      const file_input = document.querySelector("input[type=file]");
      if (!(file_input instanceof HTMLInputElement)) {
          throw new Error("Could not find the file input in the document");
      }
      if (file_input.files === null) {
          throw new Error("Please select a file first");
      }
      return file_input.files[0];
  }

  async function uploadFile(): Promise<void> {
      const file = getFileFromInput();

      console.log("Creating the file upload");
      const response = await createFile(field_id, {
          name: file.name,
          file_size: file.size,
          file_type: file.type
      });
      if ("error" in response) {
          throw new Error(
              "Could not create the file upload: " + response.error.message
          );
      }

      console.log("Starting TUS Upload");
      const uploaded_file = await uploadWithTUS(response, file);

      console.log("Attaching uploaded file to Artifact");
      const final_response = await attachFileToArtifact({
          artifact_id,
          field_id,
          file_id: uploaded_file.file_id
      });
      if (final_response && "error" in final_response) {
          throw new Error(
              "Could not attach the uploaded file to the artifact: " +
                  final_response.error.message
          );
      }
      console.log("done");
  }

  function registerTrigger(): void {
      const button = document.querySelector("button[type=button]");
      if (!button) {
          throw new Error("Could not find the button in the document");
      }
      button.addEventListener("click", () => {
          uploadFile();
      })
  }

  document.addEventListener("DOMContentLoaded", registerTrigger);

POST /svn
---------
Repository creation and settings definition can be done in REST API.

::

    {
       "project_id": 122,
       "name" : "repo01",
       "settings": {
         "commit_rules": {
           "is_reference_mandatory": true,
           "is_commit_message_change_allowed": false
         }
    }


PUT /svn/{id}
-------------
When you update an artifact you must provide all settings, for instance if you want to
allow commit message change you should provide following information to the route:

::

    {
      "settings": {
        "commit_rules": {
          "is_reference_mandatory": true ,
          "is_commit_message_change_allowed": true
        },
        "immutable_tags": {
          "paths": [],
          "whitelist": []
        },
        "access_file": "",
        "email_notifications": []
      }
     }
     
DELETE /artifacts/{id}
----------------------
Delete the corresponding artifact.

Some rule are specific to this route: 
 - only trackers administrators can delete artifacts
 - there is a limitation of how many artifacts you can delete by day (sliding windows of 24h)
 - limit is set by platform administrators and is common for all projects
 - if plugin archive deleted items is enabled, XML is archived
 
POST /projects
--------------
Here an example of the payload used to create a public project:

::

    {
      "shortname": "string",
      "description": "string",
      "label": "string",
      "is_public": true,
      "allow_restricted": true,
      "template_id": 101,
      "categories": [
          {
          "category_id": 1,
          "value_id": 2
          }
      ],
      "fields": [
          {
          "field_id": 1,
          "value": "My custom value"
          }
      ]
    }
