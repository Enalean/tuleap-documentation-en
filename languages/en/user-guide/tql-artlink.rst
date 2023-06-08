- Search for artifacts relationship:

  * ``WITH PARENT`` matches all artifacts that have a parent artifact
  * ``WITHOUT PARENT`` matches all artifacts that don't have a parent artifact
  * ``WITH PARENT ARTIFACT = 123`` matches all artifacts that have artifact #123 as a parent
  * ``WITHOUT PARENT ARTIFACT = 123`` matches all artifacts that don't have artifact #123 as a parent
  * ``WITH PARENT TRACKER = 'epic'`` matches all artifacts that have an artifact from tracker ``epic`` (regardless of the project) as a parent
  * ``WITHOUT PARENT TRACKER = 'epic'`` matches all artifacts that don't have an artifact from tracker ``epic`` (regardless of the project) as a parent
