Flowcharts
==========

The aim of this section is to provide some flowcharts representation for some parts of Tuleap.

User authentication
-------------------

See dedicated flowchart in Security: :ref:`user-authentication-flowchart`

User registration
-----------------

*Last revision of the graph: January 20th, 2022*

.. mermaid::

    graph TD
        Start[/Register form/] --> Register

        Register --> captcha{Captcha <br>ok?}
        captcha -->|no| Errors!
        captcha -->|yes| create[Create account]

        Errors! --> Start

        create --> created?{Account <br>created?}
        created? -->|no| Errors!:::danger
        created? -->|yes| oidc(OIDC link registering account)

        oidc --> admin?{User created <br> by site admin?}
        email? -->|no| admin_creation[/The user account was created.<br>Please note the login and pwd/]:::success
        admin? -->|yes| email?{Should send <br>an email?}

        admin? -->|no| no_approval?{sys_user_approval<br>=0?}
        email? -->|yes| email(Send email to user with login and pwd)

        email --> admin_creation

        no_approval? -->|no| approval![/Wait for approval/]:::success
        no_approval? -->|yes| invitation?{User invited<br>with token?}

        invitation? --> |no| confirmation(Send confirmation email)
        invitation? --> |yes| my[Log user<br>Redirect to /my/ page]

        my --> welcome[/Welcome modal<br>on /my/ page/]:::success

        confirmation --> delivery?{Mail accepted <br>for delivery?}
        delivery? -->|no| nodelivery[/Action required<br>The confirmation email<br>couldn't be sent./]:::danger
        delivery? -->|yes| sent![/Confirmation link sent/]:::success

        classDef success fill:#f4f8e9,stroke:#6abf1d,color:#137900
        classDef danger fill:#ffe5e5,stroke:#f02727,color:#b70d0d

