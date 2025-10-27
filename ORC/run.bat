robot --include %1 --listener allure_robotframework;./Results/Allure ./TestSuites/%2
allure generate ./Results/Allure --clean -o ./AllureReports
