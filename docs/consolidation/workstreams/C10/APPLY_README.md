# Apply C10 maximum-final overlay

Apply the files in this overlay over the supplied Albanian snapshot. No deletions are required.

Final C10 working-tree lock after application: `fcd3be0ebe9cadbe37422728e8ca07e49d699ed5a76aaf8679afc1ea9ecc7c2b`.

This overlay intentionally does not modify any file under `AlbanianSQI/GF/lib/src/albanian` or `AlbanianSQI/GF/lib/src/morphodict`.

After applying, run `python tools/certification/c10_certification.py lint`.
