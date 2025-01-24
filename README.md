# Shell Script Bug: Exceeding Open File Limit

This repository demonstrates a common error in shell scripting: exceeding the maximum number of open files. The `bug.sh` script creates a large number of temporary files without closing them, leading to an error. The `bugSolution.sh` script demonstrates a corrected version that addresses the issue.

**Problem:** The `bug.sh` script attempts to create 10,000 temporary files within a single loop. This can lead to exceeding the system's limit on the number of simultaneously open files, resulting in errors or script failure.

**Solution:** The `bugSolution.sh` script uses a technique to limit the number of simultaneously open files.  Each file is created, processed, and then closed before the next one is created.