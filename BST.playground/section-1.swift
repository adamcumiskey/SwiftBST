/*
*  Binary Tree implementation and exercises based on
*  http://cslibrary.stanford.edu/110/BinaryTrees.html
*
*  Adam Cumiskey 2014
*/

class BinaryTree {
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
}

// 1. build123()
var build123 = BinaryTree()
build123.insert(2)
build123.insert(1)
build123.insert(3)

println(build123.root?.data)
println(build123.root?.left?.data)
println(build123.root?.right?.data)

// 2. size()
println("The build123 tree has \(build123.size()) nodes")