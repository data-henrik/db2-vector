---update the table and create the vector values from a composed string
update cities set coord=vector(varchar('['||lat||','||long||']'),2,float32) where name=name and country=country;
