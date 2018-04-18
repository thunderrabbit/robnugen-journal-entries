git fast-export --import-marks=git.marks  --export-marks=git.marks      \
        --all | fossil import --git --incremental --import-marks        \
        fossil.marks --export-marks fossil.marks journal.fossil

fossil sync
