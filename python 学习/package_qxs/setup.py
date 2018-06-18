from setuptools import setup, find_packages

setup(name='qxs_package',
 
      version='beta',
 
      url='https://github.com/',
 
      license='MIT',
 
      author='Xinshuai Qi',
 
      author_email='@gmail.com',
 
      description='',
 
      packages=find_packages(exclude=['tests']),
 
      long_description=open('README.md').read(),
 
      zip_safe=False,
 
      setup_requires=['nose>=1.0'],
 
      test_suite='nose.collector')