 - name: employees_stg
    description: Staged employees data from order management system (OMS), with minor row-level transformation.
    columns:
      - name: JobTitle
        description: Employee's Job Title based on his current Roles and Responsibilities.
        tests:
          - string_not_empty
