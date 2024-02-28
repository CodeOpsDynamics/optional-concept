#for making attributes of subnet value optional
variable "vn" {
    default = null
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

#for making entire subnet value optional
#variable "vn" {
#    default = null
#    type = map(object({
#        name = string,
#        as = any,
#        tg = string,
#        subnets = optional(map(object({
#            sn = string,
#            ap = any
#    })))
#}))
#}
