Cli tool
========

New cli tool shoud depends on ``Tuleap Cli (src/utils/tuleap.php)``

How to add a new command
~~~~~~~~~~~~~~~~~~~~~~~~
Every new CLI command should be added in the Tuleap CLI.
To access to Tuleap cli, just run ``tuleap`` in your platform.

.. code-block:: php

    $application->add(
        new MyNewCommandClass
    );

Tuleap cli is based on `Symfony Command class <https://symfony.com/doc/current/console.html/>`_ and every
new command should follow this pattern.
A minimal class of a command:

.. code-block:: php

    use Symfony\Component\Console\Command\Command;

    class MyNewCommandClass extends Command
    {
        const NAME = 'my-new-command';

         public function execute(InputInterface $input, OutputInterface $output)
         {
            ...
         }

        protected function configure()
        {
            $this->setDescription('My command description')
                 ->addArgument(
                     'argument_name',
                     InputArgument::REQUIRED,
                     "description"
                 )
         }
    }
