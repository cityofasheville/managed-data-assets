# Creating a New Managed Data Asset

## Creating an Asset for the Open Data Portal

There is extra work involved if the dataset is to be published through the open data portal. It must either be created through ArcCatalog or registered with ArcCatalog if the data is to be accessible through the ArgGIS REST API.

If you are creating the dataset from scratch, the easiest thing to do is to create the table through ArcMap.

If the table contains GIS data, you must make sure that it uses the NC State Plane coordinate system. This should also be set for the projection (the SRID for state plane is 2264).

After the table is created/populated, you also need to run the following (for some reason the SRID doesn't automatically get transferred correctly):

````
ALTER TABLE <tablename> DROP CONSTRAINT enforce_srid_shape;
SELECT UpdateGeometrySRID('amd', '<tablename>', 'shape', 2264);
ALTER TABLE <tablename> ADD CONSTRAINT enforce_srid_shape CHECK (st_srid(shape) = 2264);
````

