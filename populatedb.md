



curl -X POST http://localhost:8080/strokes \
    -H "Content-Type: application/json" \
    -d '{"title": "Freestyle"}'

curl -X POST http://localhost:8080/strokes \
    -H "Content-Type: application/json" \
    -d '{"title": "Backstroke"}'

curl -X POST http://localhost:8080/swimsets  \
-H "Content-Type: application/json" \
-d '{"title": "Set 1", "distance": 100, "reps": 25,  "rest": 2, "stroke_ids": ["7b852f35-83d2-42ce-a526-973e04086810"]}'

curl -X POST http://localhost:8080/swimsets  \
-H "Content-Type: application/json" \
-d '{"title": "Set 2", "distance": 100, "reps": 25,  "rest": 2, "stroke_ids": ["a3f5f6df-de14-4072-98a3-59e6ee258324"]}'

curl -X POST http://localhost:8080/workouts  \
-H "Content-Type: application/json" \
-d '{"title": "Workout 1", "distance": 100, "swimset_ids": ["7b852f35-83d2-42ce-a526-973e04086810","a3f5f6df-de14-4072-98a3-59e6ee258324" ]}'