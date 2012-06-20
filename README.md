[![Build Status](https://secure.travis-ci.org/maksar/tc.png)](http://travis-ci.org/maksar/tc)

Technical Coordination project
---------------

This repository contains code, related and useful for performing technical coordination tasks -- collecting informational (technology, start date, current status, etc.) and statistical (unit tests count, unit tests coverage, build time, etc.) information about projects.

`tc` console tools allows to manage mentioned above information (add projects, edit metrics, etc.). Information itself is stored in `mongodb`. `tc` tool can be used in CI environments to automatically collect metrics (like coverage and build time).

In future, it is planned to have web interface for doing same operation as with cli `bin/tc` tool. For now, use `tc --help` to get information about supported operations and commands.

Examples:

* Add new project

        tc add project_name

* Add new metric

        tc add_metric --mt number --pn project_name metric_name

* List unit tests count for all ruby projects

        tc list --fm "{'Name' => 'name', 'Unit tests' => 'property(\"unit tests count\").value'}" "property('technology') == 'ruby'"

Code is not released as a separate gem, but will be in a nearest future.