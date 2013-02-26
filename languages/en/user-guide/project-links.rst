
.. |SYSPRODUCTNAME| replace:: Tuleap

Project Links
=============

Project Links superimpose a structure onto Tuleap project workspaces
making easily visible the relationships between projects, and they can
simplify finding related project. Applications include:

-  Project families so that a parent project workspace can gain easy
   access to its child projects (for example for programme management).
-  Rings of interest, where several projects may decide they have
   sufficient in common that they wish to be related (e.g. projects that
   use the same technology), but none of them is strictly a master, and
   each is free to join or leave the ring.
-  Linking a product-related workspace with a support project that
   covers a number of products - i.e. an easy linkage from the product
   to its support and from generalised support to a specific product
   (note that this is a simplified project family, with each project
   showing the other as a relation).

To create a project relationship, a project first defines a link type
and then assigns that link type to as many projects as it wishes. The
link type is named in any way (except it must be unique within the
project), for example "Sub-projects", "Related projects", "Division",
"Team", "C++ Projects". The main use of the name is as a heading when
the linked projects are listed.

When referring to a relationship link, the project that administers the
link is the owner and the project referenced by the link is the target
of the link. A link type also specifies a reverse name, which is used
when a project lists those of which it is the target. For example
"Children" may be the name of a link type and "Parent" the reverse link
name for that same link type. Projects linked this way would be listed
under "Children" in the owner project, but those projects would see the
(reverse) relationship as "Parent".

To create a "ring of interest", someone must take responsibility to
create (and administer) a ringmaster project (which behaves just as a
parent project in a project family but its only function is to be the
owner project links) - the ring administrator would normally take
responsibility to be the ring animator (the one who makes the ring works
well). To join a ring of interest, a project must request the ring
animator to create a relationship with it in the ringmaster project.

When a new project is created from a template project it inherits a copy
of all the project links (and link types) from the template.
Additionally, any project that references a template as a target will
gain a link to the new project (it means that the project wants all
projects created from the template to be linked as the template is).
Thus a master project may keep tabs on all projects created from a
template, and a ring may automatically expand. There is also a mechanism
that allows projects to resynchronise link types with their template.
Newly created links are highlighted with a faint yellow star - mainly to
highlight those created from template links.

A project shows reverse linkages (those projects for which it is the
link target) on the summary page.

Terms and Definitions
````````````````````````

=====================================   ==========================================
 Term                                   Definition                               
=====================================   ==========================================
**Data Aggregation**                    The process of collecting data from      
                                        related projects for display in a        
                                        collated form.                           

**Link Administrator**                  The users who are allowed to create link 
                                        types and to modify project linkages -   
                                        project administrators are automatically 
                                        link administrators.                     

 **Link Type**                          The data item that defines the           
                                        properties of a project linkage and      
                                        gives it a name. They are defined within 
                                        a project, and are inherited from a      
                                        template.                                

 **Owner**                              The project that is responsible for      
                                        creating and administering a link.       

**Project Family**                      A strict hierarchy where there is a      
                                        parent project with one or more child    
                                        (or sub-) projects.                      

 **Project Link / Relationship Link**   The data item that joins one project     
                                        with another to create related projects  
                                        - an instance of a project link type     

 **Related Projects**                   Two projects for which there is a link   
                                        entry in at least one of them pointing   
                                        to the other.                            

 **Reverse name/linkage**               The name (defined in the owner project)  
                                        to be used to describe the relationship  
                                        within its target projects' context      
                                        (e.g. parent and children).              

 **Ring of interest**                   A group of projects that have declared   
                                        themselves as having something in common 
                                        and are linked together to share         
                                        information.                             

 **Ringmaster**                         A project that exists (only) so that     
                                        other projects may reference it to       
                                        become members of a ring.                

 **Target**                             The project that is the subject of a     
                                        link from another project.               
=====================================   ==========================================

      Project links terms and definitions

Creating links
````````````````

A project administrator may add new related projects by using the
following procedure:

On the 'Project Links Configuration' page of your master project, first
set up at least one link type (if none already exists) by clicking 'Add
a project link type'.

Then tick the "Create Project links from this project" box and follow
this process:

-  go and find a project you want to link by any means you like (via My
   Personal page, project tree, browsing, favorites, ...)
-  click on the "link to this project" button/icon on the summary page
-  this takes you back to the context of the master project, there you
   select the link type (from the presented list) and "add" the link
-  either go and find another project you want to link to (repeating the
   above steps), or uncheck "link to this project"

Note that "link to this project" is a personal setting, not a project
one, so you can leave it checked all the time if you wish, which leaves
visible in all projects visited the "link to this project" button/icon
on the summary page. Checking it in another project just makes that one
the future master, there's no need to uncheck it first.

Link Administration
`````````````````````

Administration of the linkage belongs to the link owner project, the
project to which the link points is called the target project (the link
target).

Project administrator users are automatically link administrators.

On the (link) administration page, the project's link administrator user
may:

-  Add new link types.
-  Modify (including change the link type of) existing relationships
   with target project.
-  Delete individual project relationships (i.e. remove them from the
   list of related projects).
-  Delete relationship types - all referenced projects with that
   relationship are disconnected (i.e. the whole relationship is
   deleted).
-  Refresh link types from the project's template (if it has one, see
   details below)
-  Clone link type: creates an exact copy of a link type (with a
   different name)
-  Modify link types (all attributes)

Note that a project relationship linkage has an explicit direction
(owner project and target project); only the owner project link
administrator can establish and remove project links.

Ring Administration
`````````````````````

A ringmaster project is a special type of project that just displays the
list of projects linked to it using a ring-type link.

Template Projects
```````````````````

The following are inherited from a template project at project creation:

-  Project link types
-  Related project

If a template project is the target of a relationship, the new project
is (automatically) added to that linkage at project creation.

When a project is refreshed from its template, the following actions are
proposed to the user for individual confirmation:

-  Link types defined in the template and not present in the target
   project are added (thus types recently added to the template can be
   adopted into the project).
-  Link types sharing a name with the template project are replaced with
   the template ones (i.e. types with the same name in the template and
   project are assumed to be the same; and it is assumed that the
   template is the master, so they are copied from the template
   overwriting the project's version, if confirmed)
-  Linked projects in the template that are not linked to by the project
   are added.
-  Projects that specify the template as target but do not link to the
   project are identified for information only (i.e. if the project were
   being newly created, it would be added automatically to the master
   project's links, but when refreshing we can't be certain that it has
   not been deleted by that project, nor that it is really wanted as a
   link).
-  Ringmaster projects referenced by the template are offered to join
   the ring.

Note: link types that are defined in the target project but not in the
template project are neither modified nor deleted - no proposal is made
to the user; they are listed for information only.

No mechanism is proposed for a template project to force an update upon
its offspring; the template administrator user must ask the project
administrators to do the refresh themselves.
