Program Management
******************

It is possible to import program management service configuration.

Please note that increments: ``<source_tracker/>``, ``<plannable_trackers/>`` and ``<can_prioritize/>`` are mandatory
and **must have** a value.

.. sourcecode:: xml

    <?xml version="1.0"?>
    <program_management>
      <increments>
        <source_tracker REF="T36277"/>
        <plannable_trackers>
          <plannable_tracker REF="T36280"/>
          <plannable_tracker REF="T37001"/>
        </plannable_trackers>
        <can_prioritize>
          <ugroup ugroup_name="project_members"/>
        </can_prioritize>
        <section_name>Custom Increment</section_name>
        <milestones_name>custom increment</milestones_name>
      </increments>
      <iterations>
        <source_tracker REF="T36278"/>
        <section_name>Custom Iterations</section_name>
        <milestones_name>custom iteration</milestones_name>
      </iterations>
    </program_management>

