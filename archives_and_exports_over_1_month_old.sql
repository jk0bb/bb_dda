-- Although Blackboard claims that archives and exports are automatically deleted after 30 days, that's not always the case.
-- This will find all archives and exports that are over 30 days old.
SELECT SPLIT_PART(xu.full_path, '/', 4) AS course_id, xu.full_path, xf.creation_date, xf.file_size
FROM xyf_urls xu, xyf_files xf
WHERE xu.file_name LIKE '%ArchiveFile%'
AND xf.file_id = xu.file_id
AND xu.file_name LIKE '%.zip'
AND xu.full_path LIKE '/internal%'
AND xf.creation_date < DATE_TRUNC('day', NOW() - INTERVAL '1 month')
OR xu.file_name LIKE 'ArchiveExFile%'
AND xf.file_id = xu.file_id
AND xu.file_name LIKE '%.zip'
AND xu.full_path LIKE '/internal%'
AND xf.creation_date < DATE_TRUNC('day', NOW() - INTERVAL '1 month')
OR xu.file_name LIKE 'ExportFile%'
AND xf.file_id = xu.file_id
AND xu.file_name LIKE '%.zip'
AND xu.full_path LIKE '/internal%'
AND xf.creation_date < DATE_TRUNC('day', NOW() - INTERVAL '1 month')
OR xu.file_name LIKE 'CommonCartridge%'
AND xf.file_id = xu.file_id
AND xu.file_name LIKE '%.zip'
AND xu.full_path LIKE '/internal%'
AND xf.creation_date < DATE_TRUNC('day', NOW() - INTERVAL '1 month')
