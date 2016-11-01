
# coding: utf-8

# In[1]:

import os
# make sure pyspark tells workers to use python3 not 2 if both are installed
os.environ['PYSPARK_PYTHON'] = '/opt/conda/bin/python3'

import pyspark
conf = pyspark.SparkConf()

conf.setMaster("spark://spark-master:7077")
conf.setAppName('clustertest')

sc = pyspark.SparkContext(conf=conf)

rdd = sc.parallelize(range(100))
rdd.sumApprox(3)


# In[2]:

sc.stop()

