
*** Variables ***
# Configuration
${BROWSER} =  chrome
${ENVIRONMENT} =  prod
&{BASE_URL}    dev=https://openweathermap.org  qa=https://openweathermap.org  prod=https://openweathermap.org/
&{HOME_BASE_URL}  dev=https://home.openweathermap.org  qa=https://home.openweathermap.org  prod=https://home.openweathermap.org
${LOGIN_URL} =  users/sign_in
${INVALID_CREDENTIALS_PATH_CSV} =  ${CURDIR}\\Users.csv
${INVALID_CITY_PATH_CSV} =  ${CURDIR}\\Invalid_city.csv
${VALID_CITY_PATH_CSV} =  ${CURDIR}\\Valid_city.csv

