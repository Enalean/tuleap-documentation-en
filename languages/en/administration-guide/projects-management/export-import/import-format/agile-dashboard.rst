Backlog & Kanban
****************

You can import backlog and kanban configuration. There are no data related to backlog or kanban themselves. The data are in the trackers.

.. NOTE:: For historical reasons, backlog and kanban configurations are in `<agiledashboard>` node.

.. sourcecode:: xml

    <agiledashboard>
      <plannings>
        <planning name="Release Planning" plan_title="Release Plan" planning_tracker_id="T1017" backlog_title="Product Backlog">
          <backlogs>
            <backlog>T1015</backlog>
            <backlog>T1020</backlog>
          </backlogs>
        </planning>
        <planning name="Sprint Planning" plan_title="Sprint Plan" planning_tracker_id="T1018" backlog_title="Epic Backlog">
          <backlogs>
            <backlog>T1015</backlog>
            <backlog>T1020</backlog>
          </backlogs>
        </planning>
      </plannings>
      <kanban_list title="Kanban">
        <kanban tracker_id="T778" name="My personal kanban" ID="K01">
          <column wip="1" REF="V9297"/>
          ...
        </kanban>
      </kanban_list>
    </agiledashboard>

