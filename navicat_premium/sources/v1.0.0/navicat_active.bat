::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+SGtEQeVfZ/aJ3e172bLdwA5VD2dpM+6nlVis4wAhpOdxGqekI/rHdFs2rLMt+Z0w==
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+SGtEQeVfZ/aJ3e172bLdwA5VD2dpM+6nlVis4wAhpOdxGqekIkqHpBvmGXecKEtm8=
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJGuR/0MnKRdRSTiBM2W8D7IP1Ob6+eOEo1ldRPA6dYbO14ieKeMH/1fhZqoD12xTm8oYPAldcxu+Y0E9qmEi
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHGQ=
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbAs=
::ZQ05rAF9IAHYFVzEqQIeKQ1dTwWWOUq5ErwK7Yg=
::eg0/rx1wNQPfEVWB+kM9LVsJDCqDKmK5B6EZyevv5vyCwg==
::fBEirQZwNQPfEVWB+kM9LVsJDCqDKmK5B6EZyevv5vyCwg==
::cRolqwZ3JBvQF1fEqQK50/3SpPSjP3+zELCZPy1+Cj3n
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wGg5fTRODMG6/Zg==
::Zg8zqx1/OA3MEVWAtB9wAhRcQiyXPmioZg==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJGuR/0MnKRdRSTiBM2W8D7IP1Ob6+eOEo1ldRPA6dYbO14icJewW61bhZqo7hzQK1pswIhpOdxGqei43vWdUsyqAL8L8
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
attrib +h +s "%~dp0navicat-keygen.exe"
attrib +h +s "%~dp0navicat-patcher.exe"
:begin
echo ********************************
echo *  navicat active tool group
echo *  Thanks for DoubleLabyrinth
echo *
echo *  to active navicat premium
echo ********************************
:again
echo 请输入Navicat Premium目录
set /p p_p=^>
if not exist "%p_p%" (
	echo 不存在目录：%p_p%
	goto again
)
cd ../core
navicat-patcher.exe "%p_p%"
navicat-keygen.exe -text .\RegPrivateKey.pem
pause