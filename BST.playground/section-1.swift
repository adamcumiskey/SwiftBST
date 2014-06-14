/*
*  Binary Tree implementation and exercises based on
*  http://cslibrary.stanford.edu/110/BinaryTrees.html
*
*  Adam Cumiskey 2014
*/

import Foundation

class BinarySearchTree {
    var root: Node?;
    
    // Initializer for the BST
    init() {
        self.root = nil
    }
    
    // Node helper construct
    class Node {
        var data: Int?
        var left: Node?
        var right: Node?
        
        init() {
            self.data = nil
            self.left = nil
            self.right = nil
        }
        
        init(data: Int?) {
            self.data = data?
            self.left = nil
            right = nil
        }
    }
    
    /**
    *  Helper method to lookup whether a given value exists in the tree
    **/
    func lookup(data: Int) -> Bool {
        return lookup(self.root!, data: data)
    }
    
    /**
    *  Recursively search through the nodes for a value
    **/
    func lookup(node: Node?, data: Int) -> Bool {
        if node == nil {
            return false
        }
        
        if data == node?.data? {
            return true
        } else if data < node?.data? {
            return lookup(node?.left?, data: data)
        } else if data > node?.data? {
            return lookup(node?.right?, data: data)
        }
        return false
    }
    
    /**
    *  Helper method to insert data into the tree
    **/
    func insert(data: Int) {
        self.root = insert(self.root, data: data)
    }
    
    /**
    *  Insert data into the tree by recursively finding the postition that will
    *  keep the tree in order
    **/
    func insert(var node: Node!, data: Int) -> Node {
        if node == nil {
            node = Node(data: data)
        } else {
            if data <= node.data {
                node.left = insert(node.left, data: data)
            } else {
                node.right = insert(node.right, data: data)
            }
        }
        return node!;
    }
    
    /**
    *  Helper method to calculate the total size of a tree
    **/
    func size() -> Int {
        return size(self.root?)
    }
    
    /**
    *  Calculate the size of the nodes by recursively traversing the tree
    **/
    func size(node: Node?) -> Int {
        if node == nil {
            return 0;
        } else {
            return size(node?.left) + 1 + size(node?.right)
        }
    }
    
    /**
    *  Helper method to calculate the max depth of the tree
    **/
    func maxDepth() -> Int {
        return maxDepth(self.root)
    }
    
    /**
    *  Recursively calculate the max depth from a given node
    **/
    func maxDepth(node: Node?) -> Int {
        if node == nil {
            return 0;
        } else {
            var maxLeft: Int = maxDepth(node?.left?)
            var maxRight: Int = maxDepth(node?.right?)
            
            if (maxLeft > maxRight) {
                return maxLeft+1
            } else {
                return maxRight+1
            }
        }
    }
    
    /**
    *  Helper function to calculate the minimum value
    **/
    func minValue() -> Int? {
        return minValue(self.root?)
    }
    
    /**
    *  Get the minimum value by traversing all the left nodes in the tree until
    *  a leaf is reached
    **/
    func minValue(node: Node?) -> Int? {
        var currentNode = node
        while currentNode?.left? != nil {
            currentNode = currentNode?.left!
        }
        return currentNode?.data
    }
    
    /**
    *  Helper function to calculate the maximum value
    **/
    func maxValue() -> Int? {
        return maxValue(self.root?)
    }
    
    /**
    *  Get the maximum value by traversing all the right nodes in the tree until
    *  a leaf is reached
    **/
    func maxValue(node: Node?) -> Int? {
        var currentNode = node
        while currentNode?.right? != nil {
            currentNode = currentNode?.right!
        }
        return currentNode?.data
    }
    
    /**
    *  Helper function to print the tree in acending order
    **/
    func printTree() {
        printTree(self.root?)
    }
    
    /**
    *  Recursively print the tree starting from a given node
    **/
    func printTree(node: Node?) {
        if node == nil {
            return;
        }
        
        if let left = node?.left? {
            printTree(left)
        }
        
        println("\(node?.data?)")
        
        if let right = node?.right? {
            printTree(right)
        }
    }
    
    /**
    *  Helper function to print the tree in postorder
    **/
    func printPostorder() {
        printPostorder(self.root?)
    }
    
    /**
    *  Print the in postorder starting from a given node
    **/
    func printPostorder(node: Node?) {
        if node == nil {
            return;
        }
        
        if let left = node?.left? {
            printTree(left)
        }
        
        if let right = node?.right? {
            printTree(right)
        }
        
        println("\(node?.data?)")
    }
    
    /**
    *  Helper function to find whether or not a tree contains an input path sum
    **/
    func hasPathSum(sum: Int) -> Bool {
        return hasPathSum(self.root?, sum: sum)
    }
    
    /**
    *  Check to see if there is a path sum starting at a given node
    **/
    func hasPathSum(node: Node?, var sum: Int) -> Bool {
        if node? == nil {
            return sum == 0;
        } else {
            if let data = node?.data? {
                sum -= data
            }
            return (hasPathSum(node?.left?, sum: sum) ||
                hasPathSum(node?.right?, sum: sum))
        }
    }
}

// 1. build123()
var build123 = BinarySearchTree()
build123.insert(12)
build123.insert(2)
build123.insert(1)
build123.insert(32)
build123.insert(55)
build123.insert(3)
build123.insert(4)

println("-- #1 --")
println("build123()")
println("Root data: \(build123.root?.data)")
println("Left data: \(build123.root?.left?.data)")
println("Right data: \(build123.root?.right?.data) \n")

// 2. size()
println("-- #2 --")
println("size()")
println("The build123 tree has \(build123.size()) nodes \n")

// 3. maxDepth()
build123.insert(19)
build123.insert(21)
build123.insert(5)
build123.insert(9)

println("-- #3 --")
println("maxDepth()")
println("MaxDepth of build123 tree is \(build123.maxDepth()) \n")

// 4. minValue()
println("-- #4 --")
println("minValue()")
println("The build123 tree has a minValue of \(build123.minValue())\n")

// 5. maxValue()
println("-- #5 --")
println("maxValue()")
println("The build123 tree has a maxValue of \(build123.maxValue())\n")

// 6. printTree()
println("-- #6 --")
println("printTree()")
build123.printTree()

// 7. printPostorder()
println("\n-- #7 --")
println("printPostorder()")
build123.printPostorder()

// 8. hasPathSum()
println("\n-- #8 --")
println("hasPathSum()")

for i in 0..100 {
    let hasPathSum = build123.hasPathSum(i)
    if hasPathSum {
        println("Path sum in tree for \(i)")

    }
}
