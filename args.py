# -*- coding: utf-8 -*-
"""
Created on Fri Feb 16 07:48:13 2018

@author: qxs
"""

# *args and **kwargs

def test_var_args(f_arg, *argv):
    print("first normal arg:", f_arg)
    for arg in argv:
        print("another arg through *argv:", arg)

test_var_args('yasoob', 'python', 'eggs', 'test')


def greet_me(**kwargs):
    for key, value in kwargs.items():
        print("{0} == {1}".format(key, value))
greet_me(name="yasoob")
