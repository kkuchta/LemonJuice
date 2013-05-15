module AngelList
  def AngelList.getJobs
    return [Job.create({role:'foo'})]
  end
end
