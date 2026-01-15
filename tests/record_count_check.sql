-- Define the expected record counts for each table
--reference YAML is src_oms_yml
{%  set expected_counts = {
    'cust': 50,
    'emp': 20,
    'stre': 10,
    'supp': 5,
    'prod': 100,
    'ordritms': 1000,
    'ordr': 200,
}
%}

-- Test the count of the records in each table
{% for table, expected_count in expected_counts.items() %}
    SELECT '{{ table }}' AS table_name,
            (SELECT COUNT(*) FROM {{source('landing', table)}}) AS record_count,
            {{ expected_count }} AS expected_count
    WHERE (SELECT COUNT(*) FROM {{source('landing', table)}}) < {{ expected_count}}
    {% if not loop.last %} UNION ALL {% endif %}
{% endfor %}