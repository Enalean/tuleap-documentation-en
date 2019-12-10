Various examples
================

In this section you will find utilization example of REST routes.

POST /artifacts
---------------
Here an example of artifact created with some artifact typed links:

.. NOTE::

  "values" sent are the same for POST /artifacts and PUT artifacts/{id}


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

Retrieve artifact attachment
----------------------------

The following javascript snippet shows how we can retrieve the content of an
artifact, find a suitable file field and retrieve its first attachment. Assuming
that the file is an image, this can be run in the console of a recent browser
like Chrome or Firefox (don't forget to update the base url, file id, and
credentials).

.. code-block:: javascript

    (() => {
      const base_url = "https://tuleap.example.com/api/v1";
      const artifact_id = 1;
      const access_key =
        "tlp-k1-22.3329b8ac4401eaf03cf7776d6bab1809883624eef7a2e2dd2dc4d07696d32504";

      async function downloadImage() {
        const artifact = await getArtifact(artifact_id);
        const file_html_url = getFirstFileHTMLURL(artifact);
        saveTheFileSomewhere(file_html_url);
      }

      async function getArtifact(artifact_id) {
        console.log(`getArtifact (artifact_id = ${artifact_id})`);
        const init = {
          method: "GET",
          headers: new Headers({
            "Content-type": "application/json",
            "X-Auth-AccessKey": access_key
          }),
          mode: "cors"
        };
        const response = await fetch(`${base_url}/artifacts/${artifact_id}`);
        return response.json();
      }

      function getFirstFileHTMLURL(artifact) {
        const field = findFirstValidFileField(artifact);
        if (typeof field === "undefined") {
          throw new Error(
            "There are no attachments on this artifact (or you don't have permission to read them)."
          );
        }
        return field.file_descriptions[0].html_url;
      }

      const findFirstValidFileField = artifact =>
        artifact.values.find(isValidFileField);

      const isValidFileField = field =>
        field.type === "file" && fileHasAnAttachment(field);

      const fileHasAnAttachment = field => field.file_descriptions.length > 0;

      function saveTheFileSomewhere(file_html_url) {
        // For the demo, instead of saving the file, we display it in the browser
        const img = new Image();
        img.src = file_html_url;

        console.log("Attaching the image element at the end of the body");
        document.body.appendChild(img);
        console.log("done");
      }

      downloadImage();
    })();


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
