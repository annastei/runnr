RunnR
=====

Själva träningspassen representeras av modellen Workout, med tillhörande
controller WorkoutsController. Dessa har - förutom vanliga
CRUD-operationer - även metoder för att hämta statistik.

En Workout innehåller ett date, en distance och en duration (i sekunder). För att användaren ska slippa räkna om duration till just sekunder har formuläret istället ett fält för duration_string. Värdet här skrivs på formatet hh:mm:ss (eller mm:ss eller enbart ss) och kan därmed valideras, innan det vid skapandet av själva workout-instansen räknas om till sekunder. För att underlätta beräkningarna av tid används ett value object i form av en TimePeriod. En TimePeriod har egentligen bara tre attribut (hours, minutes, seconds) samt metoder för räkna om dessa till eller från en duration_string alt antal sekunder.

Själva layouten bygger på en enda sida, där både statistik och registrerade träningspass presenteras, ihop med ett formulär för att registrera nya träningspass. Som default sorteras passen i datumordning, med det senaste passet överst, men det finns även möjlighet att sortera på distance eller duration.

För API-anrop används följande URLer:

| Method | URL | Resultat |
| ---- | ------------------------------- | ------------------------------------------------------ |
| GET  | /workouts/count.json            | antal träningspass totalt                              |
| GET  | /workouts/average_speed.json    | medelhastighet                                         |
| GET  | /workouts/average_per_week.json | medelantal pass per vecka                              |
| GET  | /workouts/statistics.json       | all statistik (count, average_per_week, average_speed) |
| GET  | /workouts.json                  | lista alla workouts                                    |
| POST | /workouts.json                  | skapa ny workout                                       |
| GET  | /workouts/:id.json              | visa workout med angivet :id                           |
| PATCH | /workouts/:id.json             | uppdatera workout med angivet :id                      |
| PUT | /workouts/:id.json               | uppdatera workout med angivet :id                      |
| DELETE | /workouts/:id.json            | ta bort workout med angivet :id                        |
