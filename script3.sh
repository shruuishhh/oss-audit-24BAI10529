#!/bin/bash

echo "========================================"
echo "     GIT EXECUTABLE PERMISSION AUDIT"
echo "========================================"
echo ""

echo "  File        : /usr/bin/git"
echo "  Command     : ls -la /usr/bin/git"
echo ""

ls -la /usr/bin/git

echo ""
echo "========================================"
echo "     PERMISSION BREAKDOWN"
echo "========================================"
echo ""

PERMS=$(stat -c "%A" /usr/bin/git)
OWNER=$(stat -c "%U" /usr/bin/git)
GROUP=$(stat -c "%G" /usr/bin/git)
SIZE=$(stat -c "%s" /usr/bin/git)

echo "  Permission String : $PERMS"
echo "  Owner             : $OWNER"
echo "  Group             : $GROUP"
echo "  Size              : $SIZE bytes"
echo ""
echo "  Owner  (root) : rwx → read, write, execute"
echo "  Group  (root) : r-x → read, execute only"
echo "  Others (all)  : r-x → read, execute only"
echo ""
echo "  Git does NOT require elevated (root) access"
echo "  to run. It works within the user's own"
echo "  directories — principle of least privilege."
echo ""

echo "========================================"
echo "     GIT CONFIG LOCATIONS"
echo "========================================"
echo ""

if [ -f /etc/gitconfig ]; then
    echo "  Git System Config : /etc/gitconfig FOUND"
else
    echo "  Git System Config : /etc/gitconfig not found"
fi

if [ -f ~/.gitconfig ]; then
    echo "  Git User Config   : ~/.gitconfig FOUND"
else
    echo "  Git User Config   : ~/.gitconfig not found yet"
    echo "  (Created when you run 'git config' for first time)"
fi

echo ""
echo "========================================"
echo "  Audit complete."
echo "========================================"
