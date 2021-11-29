OUTFILEWILDCARD="/tmp/server-patching-status-"
OUTFILE="/tmp/server-patching-status-$(date +%Y%m%d)"

rm -f "$OUTFILEWILDCARD"*
yum -y update >> "$OUTFILE"
echo >> "$OUTFILE"
cat /boot/grub2/grub.cfg | grep -Pi "### BEGIN /etc/grub.d/10_linux ###" -C 2 >> "$OUTFILE"
echo >> "$OUTFILE"
needs-restarting -r >> "$OUTFILE"
echo >> "$OUTFILE"
