library(sf)
library(tidyverse)
library(mapview)
# Feldaufnahmen Studienprojekts SoSe 23 ----

trees = st_read("raw/Feldaufnahmen_Luentener_Wald_2023.gpkg") |> st_zm()

trees$durchmesser = str_replace(trees$durchmesser, ",", ".")
trees$durchmesser = as.numeric(trees$durchmesser)

tree_plots = str_extract(trees$baumnummer, pattern = "^.*(?=(\\.))")

trees$PlotID = paste0("LW", str_pad(tree_plots, width = 2, pad = "0", side = "left"))
trees = trees[order(trees$PlotID),]

trees = trees[!(trees$PlotID %in% c("LW02", "LW05")),]
trees = cbind(trees, st_coordinates(trees))

colnames(trees) = c("Species", "Circumference", "TreeID", "PlotID", "East", "North", "geom")


trees$TreeID = seq(nrow(trees))


trees$Kraft = NA
trees$Observer = "Studienprojekt2023"
trees$Date = as.Date("2023-06-01")

trees = st_drop_geometry(trees)



# Transekte Paul Netter 2024 ----

data = read.csv("raw/2024-06-05-feldarbeit/paul/Trees/Trees.csv")

data$art_id = as.numeric(data$art_id)
data$art_id[20] = 3

data = data[,c("art_id", "X", "Y")]


art_lut = data.frame(art_id = seq(9),
                     art = c("Pinus sylvestris", "Alnus glutinosa", "Quercus robur",
                             "Betula pendula", "Picea sitchensis", "Fagus sylvatica", 
                             "Fraxinus excelsior", "Quercus rubra", "Larix decidua"))

data = merge(data, art_lut, by = "art_id")


data$art_id = NULL


colnames(data) = c("East", "North", "Species")

data$DBH = NA
data$Circumference = NA
data$PlotID = NA

data$Kraft = NA
data$Observer = "PaulNetter"
data$Date = as.Date("2024-06-05")






# Feldaufnahmen Studienprojekt 2024

trees24 = read.csv("raw/2024-12-03_feldaufnahmen/trees2024sauber.csv", sep = ",")
names(trees24)
trees24 = dplyr::rename(trees24, TreeID = ID)
trees24 = dplyr::rename(trees24, PlotID = plotID)
trees24$art.kurz = NULL
trees24 = dplyr::rename(trees24, Species = art.lang)

trees24 = dplyr::rename(trees24, Circumference = umfang..m.)
trees24 = dplyr::rename(trees24, DBH = durchmesser..m.)
trees24$DBH = round(trees24$DBH, 3)


trees24$Date = lubridate::as_date(str_sub(trees24$Time, 1, 10), format = "%d/%m/%Y")
colnames(trees24)

trees24$Time = NULL

trees24$kraft = parse_number(trees24$kraft)
attributes(trees24$kraft) <- NULL
trees24 = dplyr::rename(trees24, Kraft = kraft)
trees24$Observer = "Studienprojekt2024"


trees24$Elev[trees24$Elev %in% c(0,-2)] = NA
trees24$Alt[trees24$Alt %in% c(0,-2)] = NA





# output ----


trees_comb = bind_rows(trees24, data)
trees_comb = bind_rows(trees_comb, trees)
trees_comb = rbind(trees24, data, fill = TRUE)
trees_comb$Species = str_trim(trees_comb$Species)

trees_comb = st_as_sf(trees_comb, coords = c("East", "North"), crs = 25832, remove = FALSE)

trees_comb$TreeID = seq(nrow(trees_comb))
mapview::mapview(trees_comb, zcol = "Species")

# reality check ----

table(trees_comb$Species)



write.csv(trees_comb, "tree_db.csv", row.names = FALSE)
write_sf(trees_comb, "tree_db.gpkg")
write_sf(trees_comb, "shapefile/tree_db.shp")
