puts "being seeding..."
User.destroy_all
Solution.destroy_all
Algorithm.destroy_all

puts "seeding users..."

brian = User.create!(username: 'brian')
karter = User.create!(username: 'karter')
loren = User.create!(username: 'loren')
tommy = User.create!(username: 'tommy')

puts "seeding algos and solutions..."

Algorithm.create!( 
    title: 'Two Sum',
    description: 'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

    You may assume that each input would have exactly one solution, and you may not use the same element twice.
    
    You can return the answer in any order.

    Problem Type: Array
    
    Example 1: 
    
    Input: nums = [2,7,11,15], target = 9
    Output: [0,1]
    Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

    Example 2:

    Input: nums = [3,2,4], target = 6
    Output: [1,2]

    Example 3: 

    Input: nums = [3,3], target = 6
    Output: [0,1]

    Constraints: 

    2 <= nums.length <= 104
    -109 <= nums[i] <= 109
    -109 <= target <= 109
    Only one valid answer exists.'
)

Solution.create!(
    user: brian,
    solution: "
    language: Python
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        prevMap = {} # val : index
        
        for i, n in enumerate(nums):
            diff = target - n
            if diff in prevMap:
                return [prevMap[diff], i]
            prevMap[n] = i
        return",
    algorithm_id: 1,
    time_complexity: 'O(n)',
    space_complexity: 'O(n)'
)

Solution.create!(
    user: loren,
    solution: "
    language: Ruby
    def two_sum(nums, target)
        h = {}
        nums.each_with_index do |a, i|
            n = target - a
            return [h[n], i] if h[n]
            h[a] = i
    end",
    algorithm_id: 1,
    time_complexity: 'O(n)',
    space_complexity: 'O(n)'
)

Algorithm.create!(
    title: 'Best Time To Buy And Sell Stock',
    description: 'You are given an array prices where `prices[i]` is the price of a given stock on the ith day.
    You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
    Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

    Problem Type: Array

    Example 1:

    Input: prices = [7,1,5,3,6,4]
    Output: 5
    Explanation: Buy on day 2 (price = 1)
    and sell on day 5 (price = 6), profit = 6-1 = 5.
    Note that buying on day 2 and selling on day 1 is
    not allowed because you must buy before you sell.

    Example 2:

    Input: prices = [7,6,4,3,1]
    Output: 0
    Explanation: In this case, no transactions
      are done and the max profit = 0.

    Constraints:

    1 <= prices.length <= 105
    0 <= prices[i] <= 10',
)

Solution.create!(
    user: karter,
    solution: "
    language: Ruby
    def max_profit(prices)
        min_price = prices.inject(:+)
        max_profit = 0
        current_profit = 0
          
        prices.each do |price|
          min_price = price < min_price ? price : min_price     
          current_profit = price - min_price  
          max_profit = current_profit > max_profit ? current_profit : max_profit  
        end    
          
        max_profit  
      end",
      algorithm_id: 2,
      time_complexity: 'O(n)',
      space_complexity: 'O(1)'
)

Algorithm.create!(
    title: 'Contains Duplicate',
    description: 'Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
    
    Example 1:

    Input: nums = [1,2,3,1]
    Output: true

    Example 2: 

    Input: nums = [1,2,3,4]
    Output: false

    Constraints:

    1 <= nums.length <= 105
    -109 <= nums[i] <= 109',

)

Solution.create!(
    user: tommy,
    solution: "
    language: Ruby
    def contains_duplicate(nums)
        hash = {}
        nums.each do |x|
            return true if hash[x] == x
            hash[x] = x;
        end
        false
    end",
    algorithm_id: 3,
    time_complexity: 'O(n)',
    space_complexity: 'O(n)'
)

puts "done seeding"