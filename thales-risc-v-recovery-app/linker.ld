SECTIONS
{
    ROM_BASE = 0x51000000; /* ... but actually position independent */

    . = ROM_BASE;
    .text.start : { *(.text.start) }
    . = ROM_BASE + 0x100;
    .text.wait : { *(.text.wait) }
}
