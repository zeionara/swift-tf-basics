import TensorFlow

extension Complex {
    func add(_ other: Complex) -> Complex {
        return Complex(
            real: real + other.real,
            imaginery: imaginery + other.imaginery
        )
    }
}


func main() {
    print("Hello! Here is an example of the simplest tensor: \(Tensor(1))")
    print("Here is a vector: \(Tensor([1, 2]))")
    print("And finally here is a matrix : \(Tensor<Float>([[1, 2], [3, 4]]))")
    print("Let's create a complex number...")
    let complexNumber = Complex(real: 2, imaginery: 2)
    print("It is equal to \(complexNumber)")
    print("It's conj is equal to \(complexNumber.conj)")
    print("Their sum is equal to \(complexNumber.add(complexNumber.conj))")
}

main()
