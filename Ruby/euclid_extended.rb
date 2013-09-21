def euclid_extended(num1,num2)
  raise ArgumentError, 'The two numbers must be relatively prime.' unless Math.gcd(num1,num2)==1
  num1,num2=num2,num1 unless num1>num2
  a,b,c=num1,num2,nil
  while c!=1
    log||=[]
    co_a=1
    co_b=a/b
    c=a%b
    log<<[[1,a],[-co_a,b],c]
    a,b=b,c
  end

  if log.size==1
    print "#{num1}: #{log[0][0][0]} \n #{num2}: #{log[0][1][0]}\n"
    return {num1 => log[0][0][0], num2 => log[0][1][0]}
  end

  log2=[]
  log2<<[log[-1][1][0]*log[-2][1][0]+log[-1][0][0],log[-1][1][0]*log[-2][0][0]]
  2.times {log.delete_at(-1)}

  while log.size!=0
    log2<<[log2[-1][0]*log[-1][1][0]+log2[-1][1],log2[-1][0]*log[-1][0][0]]
    log.delete_at(-1)
  end

  print "#{num1}: #{log2[-1][1]} \n #{num2}: #{log2[-1][0]}\n"
  return {num1 => log2[-1][1], num2 => log2[-1][0]}
end