struct Complex<T: SignedNumeric> {
    var real, imaginery: T
    var conj: Complex { return Complex(real: real, imaginery: -imaginery) }
    var negativeImaginery: T {
        get { -imaginery }
        set { imaginery = -newValue }
    }
}
