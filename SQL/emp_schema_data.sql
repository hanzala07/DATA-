USE [Hanzala.Mansuri]
GO
/****** Object:  Table [dbo].[emp5]    Script Date: 17/03/2022 2:18:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp5](
	[e_id] [int] IDENTITY(1,1) NOT NULL,
	[e_name] [nvarchar](50) NULL,
	[e_email] [nvarchar](50) NULL,
	[e_gender] [nvarchar](10) NULL,
	[e_salary] [int] NULL,
	[e_age] [int] NULL,
	[e_city] [nvarchar](20) NULL,
	[d_id] [int] NULL,
	[e_year] [int] NULL,
 CONSTRAINT [PK_EMP_E_ID] PRIMARY KEY CLUSTERED 
(
	[e_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[emp5] ON 

GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (1, N'aminesh', N'aminesh@gmail.com', N'MALE', 345, 23, N'gandhinagar', 1, 2005)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (4, N'anil', N'anil@gmail.com', N'MALE', 345, 51, N'vadali', 4, 2007)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (5, N'raman', N'raman@gmail.com', N'MALE', 99, 72, N'vadali', 4, 2005)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (9, N'kumud', N'kumari@gmail.com', N'FEMALE', 340, 21, N'baroda', 4, 2005)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (10, N'jigisha', N'jigisha@gmail.com', N'FEMALE', 88, 23, N'baroda', 4, 2007)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (1029, N'asha', N'asas', N'male', 165, 25, NULL, 1, 2020)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (1035, N'aminesh MA', N'aminesh@gmail.com', N'MALE', 345, 23, N'gandhinagar', 1, 2005)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (1037, N'aminesh', N'aminesh@gmail.com', N'female', 88, 23, N'gandhinagar', NULL, 2005)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (1039, N'aminesh MA', N'aminesh@gmail.com', N'MALE', 99, 23, N'gandhinagar', NULL, 2005)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (1040, N'anil', N'anil@gmail.com', N'MALE', 345, 51, N'vadali', NULL, 2007)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (1041, N'asd', N'asas', N'male', 165, 25, NULL, NULL, 2020)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (1042, N'jigisha', N'jigisha@gmail.com', N'FEMALE', 850, 23, N'baroda', NULL, 2007)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (1043, N'kumari', N'kumari@gmail.com', N'FEMALE', 340, 21, N'baroda', NULL, 2005)
GO
INSERT [dbo].[emp5] ([e_id], [e_name], [e_email], [e_gender], [e_salary], [e_age], [e_city], [d_id], [e_year]) VALUES (1045, N'raman', N'raman@gmail.com', N'MALE', 525, 72, N'vadali', NULL, 2005)
GO
SET IDENTITY_INSERT [dbo].[emp5] OFF
GO
ALTER TABLE [dbo].[emp5]  WITH CHECK ADD  CONSTRAINT [FK__emp__d_id__571DF1D5] FOREIGN KEY([d_id])
REFERENCES [dbo].[department] ([d_id])
GO
ALTER TABLE [dbo].[emp5] CHECK CONSTRAINT [FK__emp__d_id__571DF1D5]
GO
ALTER TABLE [dbo].[emp5]  WITH CHECK ADD CHECK  (([e_gender]='male' OR [e_gender]='female'))
GO
ALTER TABLE [dbo].[emp5]  WITH CHECK ADD CHECK  (([e_salary]>(0)))
GO
ALTER TABLE [dbo].[emp5]  WITH CHECK ADD  CONSTRAINT [CK_EMP_eAge] CHECK  (([e_age]<=(100)))
GO
ALTER TABLE [dbo].[emp5] CHECK CONSTRAINT [CK_EMP_eAge]
GO
