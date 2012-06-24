[![Build Status](https://secure.travis-ci.org/maksar/techcor.png)](http://travis-ci.org/maksar/techcor)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/maksar/techcor)

Technical Coordination project
---------------

This repository contains code, related and useful for performing technical coordination tasks -- collecting informational (technology, start date, current status, etc.) and statistical (unit tests count, unit tests coverage, build time, etc.) information about projects.

`techcor` console tools allows to manage mentioned above information (add projects, edit metrics, etc.). Information itself is stored in `mongodb`. `techcor` tool can be used in CI environments to automatically collect metrics (like coverage and build time).

In future, it is planned to have web interface for doing same operation as with cli `techcor` tool. For now, use `techcor --help` to get information about supported operations and commands.

Examples:

* Add new project

        techcor add project_name

* Add new metric

        techcor add_metric --mt number --pn project_name metric_name

* List unit tests count for all ruby projects

        techcor list --fm "{'Name' => 'name', 'Unit tests' => 'property(\"unit tests count\").value'}" "property('technology') == 'ruby'"

Code is not released as a separate gem, but will be in a nearest future.
