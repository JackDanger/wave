class Wave
  class Operation

# Wave document operations sport the following mutation components:
# skip
# insert characters
# insert element start
# insert element end
# insert anti-element start
# insert anti-element end
# delete characters
# delete element start
# delete element end
# delete anti-element start
# delete anti-element end
# set attributes
# update attributes
# commence annotation
# conclude annotation
# 
# The following is a more complex example document operation.
# 
# skip 3
# insert element start with tag "p" and no attributes
# insert characters "Hi there!"
# insert element end
# skip 5
# delete characters 4
# 
# From this, one could see how an entire XML document can be represented as a single document operation. 


  end
end