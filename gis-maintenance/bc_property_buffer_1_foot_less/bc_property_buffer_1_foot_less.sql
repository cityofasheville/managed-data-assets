TRUNCATE TABLE amd.bc_property_buffer_1_foot_less;
INSERT INTO amd.bc_property_buffer_1_foot_less 
  SELECT objectid, pinnum, pin, pinext, st_multi(st_buffer(shape,-4)) as shape 
  FROM amd.bc_property;
