# TreeDB


| Attribut      | Beschreibung                                      | Note                                          |
| ------------- | ------------------------------------------------- | --------------------------------------------- |
| TreeID        | Eindeutige Identifikationsnummer                  |                                               |
| PlotID        | assoziierter Plot                                 |                                               |
| East          | Ostwert UTM32N ETRS89 (EPSG 25832)                | Aus GPS                                       |
| North         | Nordwert UTM32N ETRS89 (EPSG 25832)               | Aus GPS                                       |
| Elev          | Elevation UTM32N ETRS89 (EPSG 25832)              | Aus GPS                                       |
| Lon           | Longitude WGS84 (EPSG 4326)                       | Aus GPS                                       |
| Lat           | Latitude WGS84 (EPSG 4326)                        | Aus GPS                                       |
| Alt           | Altitude WGS84 (EPSG 4326)                        | Aus GPS                                       |
| Pdop          | Messgenauigkeit                                   | Aus GPS                                       |
| HRMS          | Horizontale Genauigkeit                           | Aus GPS                                       |
| VRMS          | Vertikale Genauigkeit                             | Aus GPS                                       |
| Date          | Aufnahmezeit                                      | Aus GPS                                       |
| Art           | Baumart - siehe Liste                             |                                               |
| Circumference | Umfang des Baumes                                 | Entweder Umfang oder DBH muss gemessen werden |
| DBH           | Diameter at Breast Height - Brusthöhendurchmesser | Entweder Umfang oder DBH muss gemessen werden |
| Kraft         | Kraft'sche Klasse - Soziale Position des Baumes   |                                               |
| Observer      | Aufnahmeperson oder -gruppe                       |                                               |


## Artenliste

| wiss. Name               | Deutscher Name              |
| ------------------------ | --------------------------- |
| *Pinus sylvestris*<br>   | Gewöhnliche Kiefer          |
| *Alnus glutinosa*<br>    | Schwarz-Erle                |
| *Quercus robur*<br>      | Stieleiche                  |
| *Betula pendula*<br>     | Hänge-Birke                 |
| *Picea sitchensis*<br>   | Sitka-Fichte                |
| *Fagus sylvatica*<br>    | Rotbuche                    |
| *Fraxinus excelsior*<br> | Gemeine Esche               |
| *Quercus rubra*<br>      | Roteiche                    |
| *Larix decidua*          | Europäische Lärche          |
| *Pinus strobus*          | Weymouth-Kiefer             |
| *Betula pubescens*       | Moor-Birke                  |
| _Picea sitchensis_       | Sitka-Fichte                |
| *Sorbus aucuparia*       | Eberesche                   |
| *Frangula alnus*         | Faulbaum                    |
| *Prunus serotina*        | Spätblühende Traubenkirsche |


