Various examples
================

In this section you will find utilisation example of REST routes.

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

The following javascript snippet shows how we can retrieve the content of a file attached in an 
artifact. Assuming that the file is an image, this can be run in the console of a recent browser 
like Chrome or Firefox (don't forget to update the base url, file id, and credentials).

.. code-block:: javascript

    (async () => {
      const base_url    = 'https://tuleap-web.tuleap-aio-dev.docker/api/v1';
      const file_id     = 1;
      const credentials = { token: '50f5299d747566862811c92ba6ff6f14', user_id: 103 };
  
      const file_content = await getFileContentRecursively(file_id);
      saveTheFileSomewhere(file_content);
  
      async function getFileContentRecursively(file_id, offset = 0) {
        console.log(`getFileContentRecursively (offset = ${offset})`);
        const init = {
          method: 'GET',
          headers: new Headers({
            'Content-type': 'application/json',
            'X-Auth-Token': credentials.token,
            'X-Auth-UserId': credentials.user_id
          }),
          mode: 'cors'
        };
        const response      = await fetch(`${base_url}/artifact_files/${file_id}?offset=${offset}`, init);
        const json          = await response.json();
        const encoded_chunk = json.data;
        const decoded_chunk = atob(encoded_chunk);
  
        const limit = parseInt(response.headers.get('X-Pagination-Limit'), 10);
        const size  = parseInt(response.headers.get('X-Pagination-Size'), 10);
        if (offset + limit < size) {
          console.log('There are remaining chunks to fetch');
          const remaining_file = await getFileContentRecursively(file_id, offset + limit);
          return decoded_chunk + remaining_file;
        }
  
        return decoded_chunk;
      }
  
      function saveTheFileSomewhere(file_content) {
        // For the demo, instead of saving the file, we display it in the browser
        console.log('Building an image with the binary content we just received');
        const img = new Image();
        img.src = 'data:image/png;base64;,' + btoa(file_content);
  
        console.log('Attaching the image element at the end of the body');
        document.body.appendChild(img);
        console.log('done');
      }
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
     
DELETE /artifatcs/{id}
----------------------
Delete the corresponding artifact.

Some rule are specific to this route: 
 - only trackers administrators can delete artifacts
 - there is a limitation of how many artifacts you can delete by day (sliding windows of 24h)
 - limit is set by platform administrators and is common for all projects
 - delete artifacts are exported in XML and store in Tuleap tmp dir
 - if plugin archive deleted items is enabled, XML is archived
 
