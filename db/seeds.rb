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
    
    Problem Type: Array

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

Algorithm.create!(
    title: "Product of Array Except Self",
    description: "Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

    The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
    
    You must write an algorithm that runs in O(n) time and without using the division operation.

    Problem Type: Array
    
    Example 1:

    Input: nums = [1,2,3,4]
    Output: [24,12,8,6]

    Example 2:

    Input: nums = [-1,1,0,-3,3]
    Output: [0,0,9,0,0]
    
    Constraints:

    2 <= nums.length <= 105s
    -30 <= nums[i] <= 30
    The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.",
)

Solution.create!(
    user: karter,
    solution: "
    language: ruby
    def product_except_self(nums)
        l_arr = []
        r_arr = []
          
        # Left to right
        l_accumulator = 1
        i = 0
        while (i < nums.length)
          l_arr[i] = l_accumulator
          l_accumulator *= nums[i]
          i += 1
        end
          
        # Right to left     
        r_accumulator = 1    
        j = nums.length - 1
        while (j >= 0) 
          r_arr[j] = r_accumulator
          r_accumulator *= nums[j]
          j -= 1
        end
      
        # Sum of left and right products.
        # Note: Can optimize by doing this step in the above loop. I've kept for readability.
        return (0...nums.length).map { |i| l_arr[i] * r_arr[i] }
      end",
    algorithm_id: 4,
    time_complexity: "O(n)",
    space_complexity: "O(n)",
)

Algorithm.create!( #5
    title: 'Maximum Subarray',
    description: "Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
    A subarray is a contiguous part of an array.

    Problem Type: Array
  
    Example 1:

    Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
    Output: 6
    Explanation: [4,-1,2,1] has the largest sum = 6.
    Example 2:

    Input: nums = [1]
    Output: 1
    Example 3:

    Input: nums = [5,4,-1,7,8]
    Output: 23
    

    Constraints:

    1 <= nums.length <= 105
    -104 <= nums[i] <= 104",
)

Algorithm.create!( #6
    title: "Maximum Product Subarray",
    description: "Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product.

    The test cases are generated so that the answer will fit in a 32-bit integer.

    A subarray is a contiguous subsequence of the array.

    Problem Type: Array
    
    Example 1:
    
    Input: nums = [2,3,-2,4]
    Output: 6
    Explanation: [2,3] has the largest product 6.
    Example 2:
    
    Input: nums = [-2,0,-1]
    Output: 0
    Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
     
    
    Constraints:
    
    1 <= nums.length <= 2 * 104
    -10 <= nums[i] <= 10
    The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.",
)

Algorithm.create!( #7
    title: "Find Minimum in Rotated Sorted Array",
    description: "Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:

    [4,5,6,7,0,1,2] if it was rotated 4 times.
    [0,1,2,4,5,6,7] if it was rotated 7 times.
    Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].
    
    Given the sorted rotated array nums of unique elements, return the minimum element of this array.
    
    You must write an algorithm that runs in O(log n) time.
    
    Problem Type: Array
    
    Example 1:
    
    Input: nums = [3,4,5,1,2]
    Output: 1
    Explanation: The original array was [1,2,3,4,5] rotated 3 times.

    Example 2:
    
    Input: nums = [4,5,6,7,0,1,2]
    Output: 0
    Explanation: The original array was [0,1,2,4,5,6,7] and it was rotated 4 times.
    Example 3:
    
    Input: nums = [11,13,15,17]
    Output: 11
    Explanation: The original array was [11,13,15,17] and it was rotated 4 times. 
     
    
    Constraints:
    
    n == nums.length
    1 <= n <= 5000
    -5000 <= nums[i] <= 5000
    All the integers of nums are unique.
    nums is sorted and rotated between 1 and n times.",
)

Algorithm.create!( #8
    title: "Search in Rotated Sorted Array",
    description: "There is an integer array nums sorted in ascending order (with distinct values).

    Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].
    
    Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.
    
    You must write an algorithm with O(log n) runtime complexity.
    
    Problem Type: Array
    
    Example 1:
    
    Input: nums = [4,5,6,7,0,1,2], target = 0
    Output: 4

    Example 2:
    
    Input: nums = [4,5,6,7,0,1,2], target = 3
    Output: -1
    Example 3:
    
    Input: nums = [1], target = 0
    Output: -1
     
    
    Constraints:
    
    1 <= nums.length <= 5000
    -104 <= nums[i] <= 104
    All values of nums are unique.
    nums is an ascending array that is possibly rotated.
    -104 <= target <= 104",
)

Algorithm.create!(#9
    title: "3 Sum",
    description: "Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

    Notice that the solution set must not contain duplicate triplets.
    
    Problem Type: Array 
    
    Example 1:
    
    Input: nums = [-1,0,1,2,-1,-4]
    Output: [[-1,-1,2],[-1,0,1]]
    Explanation: 
    nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
    nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
    nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
    The distinct triplets are [-1,0,1] and [-1,-1,2].
    Notice that the order of the output and the order of the triplets does not matter.

    Example 2:
    
    Input: nums = [0,1,1]
    Output: []
    Explanation: The only possible triplet does not sum up to 0.

    Example 3:
    
    Input: nums = [0,0,0]
    Output: [[0,0,0]]
    Explanation: The only possible triplet sums up to 0.
     
    
    Constraints:
    
    3 <= nums.length <= 3000
    -105 <= nums[i] <= 105",
)

Algorithm.create!(#10
    title: "Container With Most Water",
    description: "You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

    Find two lines that together with the x-axis form a container, such that the container contains the most water.
    
    Return the maximum amount of water a container can store.
    
    Notice that you may not slant the container.
    
    Problem Type: Array
    
    Example 1:
    
    
    Input: height = [1,8,6,2,5,4,8,3,7]
    Output: 49
    Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
    Example 2:
    
    Input: height = [1,1]
    Output: 1
     
    
    Constraints:
    
    n == height.length
    2 <= n <= 105
    0 <= height[i] <= 104",
)

Algorithm.create!(#11
    title: "Sum of Two Integers",
    description: "Given two integers a and b, return the sum of the two integers without using the operators + and -.

    Problem Type: Binary

    Example 1:
    
    Input: a = 1, b = 2
    Output: 3

    Example 2:
    
    Input: a = 2, b = 3
    Output: 5
     
    
    Constraints:
    
    -1000 <= a, b <= 1000",
)

Algorithm.create!(#12
    title: "Number of 1 Bits",
    description: "Write a function that takes an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).

    Note:
    
    Note that in some languages, such as Java, there is no unsigned integer type. In this case, the input will be given as a signed integer type. It should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
    In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 3, the input represents the signed integer. -3.
     
    Problem Type: Binary

    Example 1:
    
    Input: n = 00000000000000000000000000001011
    Output: 3
    Explanation: The input binary string 00000000000000000000000000001011 has a total of three '1' bits.

    Example 2:
    
    Input: n = 00000000000000000000000010000000
    Output: 1
    Explanation: The input binary string 00000000000000000000000010000000 has a total of one '1' bit.

    Example 3:
    
    Input: n = 11111111111111111111111111111101
    Output: 31
    Explanation: The input binary string 11111111111111111111111111111101 has a total of thirty one '1' bits.
     
    
    Constraints:
    
    The input must be a binary string of length 32.",
)

Algorithm.create!(#13
    title: "Counting Bits",
    description: "Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.

    Problem Type: Binary

    Example 1:
    
    Input: n = 2
    Output: [0,1,1]
    Explanation:
    0 --> 0
    1 --> 1
    2 --> 10

    Example 2:
    
    Input: n = 5
    Output: [0,1,1,2,1,2]
    Explanation:
    0 --> 0
    1 --> 1
    2 --> 10
    3 --> 11
    4 --> 100
    5 --> 101
     
    
    Constraints:
    
    0 <= n <= 105",
)

Algorithm.create!(
    title: "Missing Number",
    description: "Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

 

    Example 1:
    
    Input: nums = [3,0,1]
    Output: 2
    Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.

    Example 2:
    
    Input: nums = [0,1]
    Output: 2
    Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.

    Example 3:
    
    Input: nums = [9,6,4,2,3,5,7,0,1]
    Output: 8
    Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.
     
    
    Constraints:
    
    n == nums.length
    1 <= n <= 104
    0 <= nums[i] <= n
    All the numbers of nums are unique.",
)

Algorithm.create!(
    title: "Reverse Bits",
    description: "Reverse bits of a given 32 bits unsigned integer.

    Note:
    
    Note that in some languages, such as Java, there is no unsigned integer type. In this case, both input and output will be given as a signed integer type. They should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
    In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 2 above, the input represents the signed integer -3 and the output represents the signed integer -1073741825.
     
    
    Example 1:
    
    Input: n = 00000010100101000001111010011100
    Output:    964176192 (00111001011110000010100101000000)
    Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.

    Example 2:
    
    Input: n = 11111111111111111111111111111101
    Output:   3221225471 (10111111111111111111111111111111)
    Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is 10111111111111111111111111111111.
     
    
    Constraints:
    
    The input must be a binary string of length 32",
)

Algorithm.create!(
    title: "Climbing Stairs",
    description: "You are climbing a staircase. It takes n steps to reach the top.

    Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
    
     
    
    Example 1:
    
    Input: n = 2
    Output: 2
    Explanation: There are two ways to climb to the top.
    1. 1 step + 1 step
    2. 2 steps

    Example 2:
    
    Input: n = 3
    Output: 3
    Explanation: There are three ways to climb to the top.
    1. 1 step + 1 step + 1 step
    2. 1 step + 2 steps
    3. 2 steps + 1 step
     
    
    Constraints:
    
    1 <= n <= 45",
)

Algorithm.create!(
    title: "Coin Change",
    description: "You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

    Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
    
    You may assume that you have an infinite number of each kind of coin.
    
     
    
    Example 1:
    
    Input: coins = [1,2,5], amount = 11
    Output: 3
    Explanation: 11 = 5 + 5 + 1

    Example 2:
    
    Input: coins = [2], amount = 3
    Output: -1

    Example 3:
    
    Input: coins = [1], amount = 0
    Output: 0
     
    
    Constraints:
    
    1 <= coins.length <= 12
    1 <= coins[i] <= 231 - 1
    0 <= amount <= 104",
)

Algorithm.create!(
    title: "Longest Increasing Subsequence",
    description: "Given an integer array nums, return the length of the longest strictly increasing subsequence.

    A subsequence is a sequence that can be derived from an array by deleting some or no elements without changing the order of the remaining elements. For example, [3,6,2,7] is a subsequence of the array [0,3,1,6,2,2,7].
    
     
    
    Example 1:
    
    Input: nums = [10,9,2,5,3,7,101,18]
    Output: 4
    Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.

    Example 2:
    
    Input: nums = [0,1,0,3,2,3]
    Output: 4

    Example 3:
    
    Input: nums = [7,7,7,7,7,7,7]
    Output: 1
     
    
    Constraints:
    
    1 <= nums.length <= 2500
    -104 <= nums[i] <= 104",
)

Algorithm.create!(
    title: "Longest Common Subsequence",
    description: "Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.

    A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.
    
    For example, "ace" is a subsequence of "abcde".
    A common subsequence of two strings is a subsequence that is common to both strings.
    
     
    
    Example 1:
    
    Input: text1 = "abcde", text2 = "ace" 
    Output: 3  
    Explanation: The longest common subsequence is "ace" and its length is 3.

    Example 2:
    
    Input: text1 = "abc", text2 = "abc"
    Output: 3
    Explanation: The longest common subsequence is "abc" and its length is 3.

    Example 3:
    
    Input: text1 = "abc", text2 = "def"
    Output: 0
    Explanation: There is no such common subsequence, so the result is 0.
     
    
    Constraints:
    
    1 <= text1.length, text2.length <= 1000
    text1 and text2 consist of only lowercase English characters.",
)

Algorithm.create!(
    title: "World Break Problem",
    description: "Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.

    Note that the same word in the dictionary may be reused multiple times in the segmentation.
    
     
    
    Example 1:
    
    Input: s = "leetcode", wordDict = ["leet","code"]
    Output: true
    Explanation: Return true because "leetcode" can be segmented as "leet code".

    Example 2:
    
    Input: s = "applepenapple", wordDict = ["apple","pen"]
    Output: true
    Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
    Note that you are allowed to reuse a dictionary word.

    Example 3:
    
    Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
    Output: false
     
    
    Constraints:
    
    1 <= s.length <= 300
    1 <= wordDict.length <= 1000
    1 <= wordDict[i].length <= 20
    s and wordDict[i] consist of only lowercase English letters.
    All the strings of wordDict are unique.",
)

Algorithm.create!(
    title: "Combination Sum IV",
    description: "Given an array of distinct integers nums and a target integer target, return the number of possible combinations that add up to target.

    The test cases are generated so that the answer can fit in a 32-bit integer.
    
     
    
    Example 1:
    
    Input: nums = [1,2,3], target = 4
    Output: 7
    Explanation:
    The possible combination ways are:
    (1, 1, 1, 1)
    (1, 1, 2)
    (1, 2, 1)
    (1, 3)
    (2, 1, 1)
    (2, 2)
    (3, 1)
    Note that different sequences are counted as different combinations.

    Example 2:
    
    Input: nums = [9], target = 3
    Output: 0
     
    
    Constraints:
    
    1 <= nums.length <= 200
    1 <= nums[i] <= 1000
    All the elements of nums are unique.
    1 <= target <= 1000",
)

Algorithm.create!(
    title: "House Robber",
    description: "You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

    Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.
    
     
    
    Example 1:
    
    Input: nums = [1,2,3,1]
    Output: 4
    Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
    Total amount you can rob = 1 + 3 = 4.

    Example 2:
    
    Input: nums = [2,7,9,3,1]
    Output: 12
    Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
    Total amount you can rob = 2 + 9 + 1 = 12.
     
    
    Constraints:
    
    1 <= nums.length <= 100
    0 <= nums[i] <= 400",
)

Algorithm.create!(
    title: "House Robber II",
    description: "You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.

    Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.
    
     
    
    Example 1:
    
    Input: nums = [2,3,2]
    Output: 3
    Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.

    Example 2:
    
    Input: nums = [1,2,3,1]
    Output: 4
    Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
    Total amount you can rob = 1 + 3 = 4.

    Example 3:
    
    Input: nums = [1,2,3]
    Output: 3
     
    
    Constraints:
    
    1 <= nums.length <= 100
    0 <= nums[i] <= 1000",
)

Algorithm.create!(
    title: "Decode Ways",
    description: "A message containing letters from A-Z can be encoded into numbers using the following mapping:

    'A' -> "1"
    'B' -> "2"
    ...
    'Z' -> "26"
    To decode an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above (there may be multiple ways). For example, "11106" can be mapped into:
    
    "AAJF" with the grouping (1 1 10 6)
    "KJF" with the grouping (11 10 6)
    Note that the grouping (1 11 06) is invalid because "06" cannot be mapped into 'F' since "6" is different from "06".
    
    Given a string s containing only digits, return the number of ways to decode it.
    
    The test cases are generated so that the answer fits in a 32-bit integer.
    
     
    
    Example 1:
    
    Input: s = "12"
    Output: 2
    Explanation: "12" could be decoded as "AB" (1 2) or "L" (12).

    Example 2:
    
    Input: s = "226"
    Output: 3
    Explanation: "226" could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).

    Example 3:
    
    Input: s = "06"
    Output: 0
    Explanation: "06" cannot be mapped to "F" because of the leading zero ("6" is different from "06").
     
    
    Constraints:
    
    1 <= s.length <= 100
    s contains only digits and may contain leading zero(s).",
)

Algorithm.create!(
    title: "Unique Paths",
    description: "There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.

    Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.
    
    The test cases are generated so that the answer will be less than or equal to 2 * 109.
    
    Example 1:

    Input: m = 3, n = 2
    Output: 3
    Explanation: From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
    1. Right -> Down -> Down
    2. Down -> Down -> Right
    3. Down -> Right -> Down
    

    Constraints:

    1 <= m, n <= 100",
)

Algorithm.create!(
    title: "Jump Game",
    description: "You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

    Return true if you can reach the last index, or false otherwise.
    
     
    
    Example 1:
    
    Input: nums = [2,3,1,1,4]
    Output: true
    Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

    Example 2:
    
    Input: nums = [3,2,1,0,4]
    Output: false
    Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
     
    
    Constraints:
    
    1 <= nums.length <= 104
    0 <= nums[i] <= 105",
)

puts "done seeding"