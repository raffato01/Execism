-- Schema:
-- CREATE TABLE "bottle-song" (
--         start_bottles INTEGER NOT NULL,
--         take_down     INTEGER NOT NULL,
--         result        TEXT
-- );
-- Task: update bottle-song table and set the result based on the
-- start_bottles and take_down.
-- Esempio di come pulire la tua stringa per la canzone
UPDATE "bottle-song"
SET result = (
    WITH RECURSIVE
    -- Mappatura dei numeri in parole e gestione plurali
    num_map(n, word, plural) AS (
        VALUES 
        (10, 'Ten', 'bottles'), (9, 'Nine', 'bottles'), (8, 'Eight', 'bottles'),
        (7, 'Seven', 'bottles'), (6, 'Six', 'bottles'), (5, 'Five', 'bottles'),
        (4, 'Four', 'bottles'), (3, 'Three', 'bottles'), (2, 'Two', 'bottles'),
        (1, 'One', 'bottle'), (0, 'no', 'bottles')
    ),
    -- Generatore di strofe basato su take_down
    verses(current_start, remaining_take, verse_text) AS (
        SELECT 
            start_bottles,
            take_down,
            ''
        UNION ALL
        SELECT 
            v.current_start - 1,
            v.remaining_take - 1,
            CASE WHEN v.verse_text = '' THEN '' ELSE v.verse_text || CHAR(10) || CHAR(10) END ||
            (SELECT word || ' green ' || plural FROM num_map WHERE n = v.current_start) || ' hanging on the wall,' || CHAR(10) ||
            (SELECT word || ' green ' || plural FROM num_map WHERE n = v.current_start) || ' hanging on the wall,' || CHAR(10) ||
            'And if one green bottle should accidentally fall,' || CHAR(10) ||
            'There''ll be ' || LOWER((SELECT word FROM num_map WHERE n = v.current_start - 1)) || 
            ' green ' || (SELECT plural FROM num_map WHERE n = v.current_start - 1) || ' hanging on the wall.'
        FROM verses v
        WHERE v.remaining_take > 0
    )
    SELECT verse_text FROM verses WHERE remaining_take = 0
);