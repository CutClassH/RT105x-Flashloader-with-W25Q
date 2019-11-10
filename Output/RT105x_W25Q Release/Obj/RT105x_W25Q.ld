MEMORY
{
  UNPLACED_SECTIONS (wx) : ORIGIN = 0x100000000, LENGTH = 0
  RAM5 (wx) : ORIGIN = 0x80000000, LENGTH = 0x02000000
  RAM4 (wx) : ORIGIN = 0x20200000, LENGTH = 0x00040000
  RAM3 (wx) : ORIGIN = 0x00000000, LENGTH = 0x00020000
  RAM2 (wx) : ORIGIN = 0x60000000, LENGTH = 0x04000000
  RAM (wx) : ORIGIN = 0x20000000, LENGTH = 0x00020000
}

SECTIONS
{
  __RAM5_segment_start__ = 0x80000000;
  __RAM5_segment_end__ = 0x82000000;
  __RAM5_segment_size__ = 0x02000000;
  __RAM4_segment_start__ = 0x20200000;
  __RAM4_segment_end__ = 0x20240000;
  __RAM4_segment_size__ = 0x00040000;
  __RAM3_segment_start__ = 0x00000000;
  __RAM3_segment_end__ = 0x00020000;
  __RAM3_segment_size__ = 0x00020000;
  __RAM2_segment_start__ = 0x60000000;
  __RAM2_segment_end__ = 0x64000000;
  __RAM2_segment_size__ = 0x04000000;
  __RAM_segment_start__ = 0x20000000;
  __RAM_segment_end__ = 0x20020000;
  __RAM_segment_size__ = 0x00020000;

  __HEAPSIZE__ = 256;
  __STACKSIZE_PROCESS__ = 0;
  __STACKSIZE__ = 256;

  __PrgCode_load_start__ = ALIGN(__RAM_segment_start__ , 4);
  PrgCode ALIGN(__RAM_segment_start__ , 4) : AT(ALIGN(__RAM_segment_start__ , 4))
  {
    __PrgCode_start__ = .;
    KEEP(*(PrgCode PrgCode.*))
  }
  __PrgCode_end__ = __PrgCode_start__ + SIZEOF(PrgCode);
  __PrgCode_size__ = SIZEOF(PrgCode);
  __PrgCode_load_end__ = __PrgCode_end__;

  . = ASSERT(__PrgCode_start__ == __PrgCode_end__ || (__PrgCode_end__ - __RAM_segment_start__) <= __RAM_segment_size__ , "error: PrgCode is too large to fit in RAM memory segment");

  __PrgData_load_start__ = ALIGN(__PrgCode_end__ , 4);
  PrgData ALIGN(__PrgCode_end__ , 4) : AT(ALIGN(__PrgCode_end__ , 4))
  {
    __PrgData_start__ = .;
    KEEP(*(PrgData PrgData.*))
  }
  __PrgData_end__ = __PrgData_start__ + SIZEOF(PrgData);
  __PrgData_size__ = SIZEOF(PrgData);
  __PrgData_load_end__ = __PrgData_end__;

  . = ASSERT(__PrgData_start__ == __PrgData_end__ || (__PrgData_end__ - __RAM_segment_start__) <= __RAM_segment_size__ , "error: PrgData is too large to fit in RAM memory segment");

  __DevDscr_load_start__ = ALIGN(__PrgData_end__ , 4);
  DevDscr ALIGN(__PrgData_end__ , 4) : AT(ALIGN(__PrgData_end__ , 4))
  {
    __DevDscr_start__ = .;
    KEEP(*(DevDscr DevDscr.*))
  }
  __DevDscr_end__ = __DevDscr_start__ + SIZEOF(DevDscr);
  __DevDscr_size__ = SIZEOF(DevDscr);
  __DevDscr_load_end__ = __DevDscr_end__;

  __RAM_segment_used_end__ = ALIGN(__PrgData_end__ , 4) + SIZEOF(DevDscr);
  __RAM_segment_used_size__ = __RAM_segment_used_end__ - __RAM_segment_start__;

  . = ASSERT(__DevDscr_start__ == __DevDscr_end__ || (__DevDscr_end__ - __RAM_segment_start__) <= __RAM_segment_size__ , "error: DevDscr is too large to fit in RAM memory segment");

}

