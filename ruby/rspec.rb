
#Go inside a method to count calls and check their distribution

def count_error_within_bounds?(array,expected_count,bound)
  #Checks whether array counts exceed a given difference from expected counts
  counts = array.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}.values
  if counts.map{|x| (expected_count-x.abs)}.max < bound
    return true
  else
    return false
  end
end


it 'sets groups with the correct distribution' do
  #Checks groups are properly distributed
  #This is clumsy and may be abstractable into a matcher
  n=1000
  original_method = Fling.method(:new)

  groups = []
  expect(Fling).to receive(:new).at_least(:once) do |*args|
    groups << args[0][:curation_group]
    original_method.call(*args)
  end

  n.times do
    SetCurationGroupService.new(999).call
  end
  #Check mean is right, this is reasonable because group values are linear
  expect(count_error_within_bounds?(groups,n/10.0,20)).to be true
end
