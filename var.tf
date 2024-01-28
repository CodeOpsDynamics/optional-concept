variable "vn" {
    type = map(object({
        name = string,
        as = any,
        tg = string,
        subnets = map(object({
            sn = optional(string),
            ap = optional(any)
    }))
}))

}