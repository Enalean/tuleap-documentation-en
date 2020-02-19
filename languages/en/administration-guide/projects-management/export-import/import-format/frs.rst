Releases and Files (FRS)
************************

The released files (FRS) can be imported, the XML syntax is:

.. sourcecode:: xml

  <project>
    <services>
      <service shortname="file" enabled="true" />
      ...
    </services>

    ...
    <frs>

      <package
        id="12"
        name="package1"
        rank="1"
        hidden="false">
        <read-access>
          <ugroup>project_members</ugroup>
          ...
        </read-access>

        <release
          id="30"
          name="release"
          time="2015-12-03T14:55:00"
          preformatted="false"
          artifact_id="101">

          <read-access>
            <ugroup>project_members</ugroup>
            ...
          </read-access>
          <notes>some notes</notes>
          <changes>some changes</changes>
          <user format="username">alice</user>

          <file
            src="data/foobar"
            md5sum="9db014ab2eb1df99a730c092a757782b"
            name="lefichier-foobar"
            release-time="2015-12-03T16:46:00"
            post-date="2015-12-03T16:46:00"
            arch="x86_64"
            filetype="text">

            <description>one file to rule them all</description>
            <user format="username">alice</user>

          </file>

          <link name="test" url="http://example.com" release-time="2016-07-19T10:38:19+01:00">
             <user format="username">alice</user>
          </link>
          ...

        </release>
        ...

      </package>
      ...

    </frs>

    ...
  </project>

The XML must contain a single ``<frs/>`` element containing zero or more packages. The packages can contain zero or more releases, which can contain zero or more files.

A package is constructed using a ``<package/>`` XML element containing:

- A ``name`` attribute
- A ``rank`` optional integer attribute
- A ``hidden`` optional boolean attribute
- A single ``<read-access/>`` element containing the access definitions.
- A ``<release/>`` element per releease.

A release is constructed using a ``<release/>`` XML element containing:

- A ``name`` attribute
- A ``time`` attribute containing the ISO-8601 representation of the release date.
- A ``preformatted`` attribute containing a boolean that indicates if the release notes and changelog are preformatted.
- An ``artifact_id`` attribute referencing an artifact that must be present in the XML content. The FRS plugin must be installed to take into account the value.
- A single ``<read-access/>`` element containing the access definitions.
- A single ``<notes/>`` element containing the release notes
- A single ``<changes/>`` element containing the changelog
- A single ``<user>`` element describing the user who made the release
- A ``<file/>`` element per file contained in the release

A file is constructed using a ``<file/>`` XML element containing:

- A ``src`` attribute pointing to the file to import (relative to the XML file)
- A ``md5sum`` attribute containing the MD5 hash of the file (checked on import, optional)
- A ``name`` attribute: the file name (optional)
- A ``release-time`` attribute: the ISO-8601 representation of the time when the file was released (optional, current time used if not provided)
- A ``post-date`` attribute encoded in ISO-8601 (optional, current time used if not provided)
- An ``arch`` attribute: the name of the architecture of the file as appearing in the table ``frs_processor``.
  On a fresh install, the processor list is ``i386``, ``x86_64``, ``PPC``, ``MIPS``, ``Sparc``, ``UltraSparc``, ``IA64``, ``Alpha``, ``Any``, ``Other``.
- A ``filetype`` attribute: the name of the file type of the file as appearing in the column ``frs_filetype``.
  On a fresh install, the file types available are ``Binary .rpm``, ``Binary .deb``, ``Binary .zip``, ``Binary .bz2``, ``Binary .gz``, ``Binary .tar.gz, .tgz``, ``Binary .jar``, ``Binary installer``, ``Other Binary File``, ``Source .rpm``, ``Source .zip``, ``Source .bz2``, ``Source .gz``, ``Source .tar.gz, .tgz``, ``Other Source File``, ``.Documentation (any format)``, ``text``, ``html``, ``pdf``, ``Other``.
- An optional ``<description/>`` element containing a file description
- An optional ``<user/>`` element describing the user who posted the file


Access definitions consists of zero to many ``<ugroup/>`` tags, each containing the name of the user group that is allowed access.
