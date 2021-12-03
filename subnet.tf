# =====================================================
# Creating Subnets Public1
# =====================================================

resource "aws_subnet" "Public1" {
  vpc_id                            = aws_vpc.vpc.id
  cidr_block                        = var.public1_cidr
  availability_zone              = var.public1_az
  map_public_ip_on_launch           = true
  tags = {
    Name = "${var.project}-public1-sg"
    project = var.project
  }
}


# =====================================================
# Creating Subnets Public2
# =====================================================

resource "aws_subnet" "Public2" {
  vpc_id                                = aws_vpc.vpc.id
  cidr_block                            = var.public2_cidr
  availability_zone                  = var.public2_az
  map_public_ip_on_launch               = true

  tags = {
    Name = "${var.project}-public2-sg"
    project = var.project
  }
}


# =====================================================
# Creating Subnets Public3
# =====================================================

resource "aws_subnet" "Public3" {
  vpc_id                            = aws_vpc.vpc.id
  cidr_block                        = var.public3_cidr
  availability_zone              = var.public3_az
  map_public_ip_on_launch           = true

  tags = {
    Name = "${var.project}-public3-sg"
    project = var.project
  }
}


#=================================================================================================


# =====================================================
# Creating Subnets private1
# =====================================================

resource "aws_subnet" "private1" {
  vpc_id                            = aws_vpc.vpc.id
  cidr_block                        = var.private1_cidr
  availability_zone              = var.private1_az
  map_public_ip_on_launch           = false

  tags = {
    Name = "${var.project}-private1-sg"
    project = var.project
  }
}



# =====================================================
# Creating Subnets private2
# =====================================================

resource "aws_subnet" "private2" {
  vpc_id                            = aws_vpc.vpc.id
  cidr_block                        = var.private2_cidr
  availability_zone              = var.private2_az
  map_public_ip_on_launch           = false

  tags = {
    Name = "${var.project}-private2-sg"
    project = var.project
  }
}


# =====================================================
# Creating Subnets private3
# =====================================================

resource "aws_subnet" "private3" {
  vpc_id                            = aws_vpc.vpc.id
  cidr_block                        = var.private3_cidr
  availability_zone              = var.private3_az
  map_public_ip_on_launch           = false

  tags = {
    Name = "${var.project}-private3-sg"
    project = var.project
  }
}

