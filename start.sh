#!/bin/bash

$(cd ./sp_client && dart serve) | $(cd ./sp_server && dart ./bin/main.dart)