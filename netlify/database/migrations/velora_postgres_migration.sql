-- Velora PostgreSQL database
-- Designed from the current Velora frontend

CREATE TABLE IF NOT EXISTS cars (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    color VARCHAR(20) NOT NULL,
    description TEXT NOT NULL,
    power_hp INTEGER NOT NULL CHECK (power_hp > 0),
    top_speed_kmh INTEGER NOT NULL CHECK (top_speed_kmh > 0),
    zero_to_100_sec NUMERIC(4,1) NOT NULL CHECK (zero_to_100_sec > 0),
    range_km INTEGER NOT NULL CHECK (range_km > 0),
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS features (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL UNIQUE,
    description TEXT NOT NULL
);

-- Seed the three cars shown in the Velora frontend
INSERT INTO cars
    (name, color, description, power_hp, top_speed_kmh, zero_to_100_sec, range_km)
VALUES
    (
        'Vela Coupe',
        '#ff4d8d',
        'A two-door grand tourer with a throaty V8 and a body that looks fast standing still.',
        520, 300, 3.9, 650
    ),
    (
        'Lumen EV',
        '#2ee6c5',
        'Silent, instant torque and a battery built for a full day of coastal driving.',
        480, 250, 3.2, 720
    ),
    (
        'Orion Hyper',
        '#ffb02e',
        'A track-bred hypercar with active aero and a launch that pins you to the seat.',
        900, 380, 2.4, 420
    )
ON CONFLICT (name) DO NOTHING;

-- Seed the three feature cards shown on the page
INSERT INTO features (title, description)
VALUES
    (
        'Quiet cabin',
        'Layered glass and tuned airflow keep wind noise low, so the road is all you hear.'
    ),
    (
        'Adaptive suspension',
        'The chassis reads the surface every millisecond and softens bumps before you feel them.'
    ),
    (
        'Night-ready lights',
        'Matrix headlights shape the beam around other cars and light every curve ahead.'
    )
ON CONFLICT (title) DO NOTHING;

-- Test queries
-- SELECT * FROM cars ORDER BY id;
-- SELECT * FROM features ORDER BY id;
