library(rgdal)
library(ggplot2)
library(maptools)

# Data from http://thematicmapping.org/downloads/world_borders.php.
# Direct link: http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip
# Unpack and put the files in a dir 'data'

gpclibPermit()
world.map <- readOGR(dsn="data", layer="TM_WORLD_BORDERS_SIMPL-0.3")
world.ggmap <- fortify(world.map, region = "NAME")

n <- length(unique(world.ggmap$id))
df <- data.frame(id = unique(world.ggmap$id),
                 growth = 4*runif(n),
                 category = factor(sample(1:5, n, replace=T)))

## noise
df[c(sample(1:100,40)),c("growth", "category")] <- NA


ggplot(df, aes(map_id = id)) +
     geom_map(aes(fill = growth, color = category), map =world.ggmap) +
     expand_limits(x = world.ggmap$long, y = world.ggmap$lat) +
     scale_fill_gradient(low = "red", high = "blue", guide = "colorbar")
