USE [sipre]
GO
/****** Object:  User [alejozepol]    Script Date: 11/09/2016 5:30:50 p. m. ******/
CREATE USER [alejozepol] FOR LOGIN [alejozepol] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [m2ss]    Script Date: 11/09/2016 5:30:50 p. m. ******/
CREATE SCHEMA [m2ss]
GO
/****** Object:  Table [dbo].[be_solicitudbeneficios]    Script Date: 11/09/2016 5:30:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_solicitudbeneficios](
	[codSoli] [int] IDENTITY(104,1) NOT NULL,
	[codProveedor] [int] NOT NULL,
	[codTomador] [int] NOT NULL,
	[estSolicitud] [nchar](1) NOT NULL,
	[fecSolicitud] [date] NOT NULL,
	[codservicios] [int] NOT NULL,
	[observaciones] [nvarchar](255) NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_be_solicitudbeneficios_codSoli] PRIMARY KEY CLUSTERED 
(
	[codSoli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[be_tipobeneficio]    Script Date: 11/09/2016 5:30:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_tipobeneficio](
	[codServicio] [int] NOT NULL,
	[codProveedor] [int] NOT NULL,
	[codTipServicio] [int] NOT NULL,
	[tipContrato] [nchar](1) NOT NULL,
	[indActividad] [nchar](1) NULL,
	[afePrescipciones] [nchar](1) NULL,
	[porEmpleado] [float] NOT NULL,
	[porEmpresa] [float] NOT NULL,
	[actUsuario] [nvarchar](15) NOT NULL,
	[actEstado] [nchar](1) NOT NULL,
	[actHora] [datetime] NOT NULL,
 CONSTRAINT [PK_be_tipobeneficio_codServicio] PRIMARY KEY CLUSTERED 
(
	[codServicio] ASC,
	[tipContrato] ASC,
	[codProveedor] ASC,
	[codTipServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [be_tipobeneficio$codServ_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[be_tiposervicio]    Script Date: 11/09/2016 5:30:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_tiposervicio](
	[codTipServicio] [int] NOT NULL,
	[nomServicio] [nvarchar](20) NOT NULL,
	[indActividad] [nchar](1) NOT NULL,
	[natuServicio] [nchar](1) NOT NULL,
	[factura] [nchar](1) NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_be_tiposervicio_codTipServicio] PRIMARY KEY CLUSTERED 
(
	[codTipServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [be_tiposervicio$codTser_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codTipServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bi_beneficiariosempleados]    Script Date: 11/09/2016 5:30:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bi_beneficiariosempleados](
	[codEmpleado] [int] NOT NULL,
	[codBeneficiario] [int] NOT NULL,
	[tipBeneficio] [nchar](1) NOT NULL,
	[munNacimiento] [int] NOT NULL,
	[fechNacimiento] [date] NOT NULL,
	[fechIniContrato] [date] NOT NULL,
	[fecFinContrato] [date] NOT NULL,
	[actUsuario] [int] NOT NULL,
	[estActividad] [nchar](1) NOT NULL,
	[actHora] [datetime] NOT NULL,
 CONSTRAINT [PK_bi_beneficiariosempleados_codBeneficiario] PRIMARY KEY CLUSTERED 
(
	[codBeneficiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [bi_beneficiariosempleados$codBenef_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codBeneficiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [bi_beneficiariosempleados$codEmpl_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bi_datosempleado]    Script Date: 11/09/2016 5:30:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bi_datosempleado](
	[codEmpleado] [int] NOT NULL,
	[numContrato] [int] NOT NULL,
	[munNacimiento] [int] NOT NULL,
	[fechNacimiento] [date] NOT NULL,
	[tipContrato] [nchar](1) NOT NULL,
	[indActividad] [nchar](1) NOT NULL,
	[fechIniContrato] [date] NOT NULL,
	[fecFinContrato] [date] NOT NULL,
	[sueBasico] [int] NOT NULL,
	[actUsuario] [int] NOT NULL,
	[actEstado] [nchar](1) NOT NULL,
	[actHora] [datetime] NOT NULL,
 CONSTRAINT [PK_bi_datosempleado_codEmpleado] PRIMARY KEY CLUSTERED 
(
	[codEmpleado] ASC,
	[numContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [bi_datosempleado$codEmpl_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bi_datosproveedor]    Script Date: 11/09/2016 5:30:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bi_datosproveedor](
	[codProveedor] [int] NOT NULL,
	[tipProveedor] [nchar](1) NOT NULL,
	[indActividad] [nchar](1) NOT NULL,
	[fecInicio] [date] NOT NULL,
	[fecFinal] [date] NOT NULL,
	[actUsuario] [int] NOT NULL,
	[actEstado] [nchar](1) NOT NULL,
	[actHora] [datetime] NOT NULL,
 CONSTRAINT [PK_bi_datosproveedor_codProveedor] PRIMARY KEY CLUSTERED 
(
	[codProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [bi_datosproveedor$idprDatob_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bi_datosterceros]    Script Date: 11/09/2016 5:30:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bi_datosterceros](
	[codTerc] [int] NOT NULL,
	[tipTerc] [nchar](1) NOT NULL,
	[tipIdent] [nchar](2) NOT NULL,
	[priNombre] [nvarchar](20) NOT NULL,
	[segNombre] [nvarchar](20) NULL,
	[priApellido] [nvarchar](20) NOT NULL,
	[segApellido] [nvarchar](20) NULL,
	[codMunicipio] [int] NOT NULL,
	[dirResidencia] [nvarchar](15) NOT NULL,
	[telResidencia] [int] NOT NULL,
	[corElectronico] [nvarchar](45) NOT NULL,
	[actUsuario] [int] NOT NULL,
	[actEsta] [nchar](1) NOT NULL,
	[actHora] [datetime] NOT NULL,
 CONSTRAINT [PK_bi_datosterceros_codTerc] PRIMARY KEY CLUSTERED 
(
	[codTerc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [bi_datosterceros$codTerc_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codTerc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gn_departamento]    Script Date: 11/09/2016 5:30:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gn_departamento](
	[codDepartamento] [int] NOT NULL,
	[codPais] [int] NOT NULL,
	[nomDepartamento] [nvarchar](30) NULL,
	[usuActividad] [nchar](15) NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_departamento_codDepartamento] PRIMARY KEY CLUSTERED 
(
	[codDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [gn_departamento$codPais_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gn_detallemenu]    Script Date: 11/09/2016 5:30:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gn_detallemenu](
	[codMenu] [int] NOT NULL,
	[codPrograma] [int] NOT NULL,
	[codRol] [int] NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_detallemenu_codMenu] PRIMARY KEY CLUSTERED 
(
	[codMenu] ASC,
	[codRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [gn_detallemenu$codMenu_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [gn_detallemenu$codRolu_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gn_detallerol]    Script Date: 11/09/2016 5:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gn_detallerol](
	[codRol] [int] NOT NULL,
	[codUsuario] [nchar](15) NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_detallerol_codRol] PRIMARY KEY CLUSTERED 
(
	[codRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [gn_detallerol$codRolu_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gn_documentosadjuntostercero]    Script Date: 11/09/2016 5:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gn_documentosadjuntostercero](
	[codTercero] [int] NOT NULL,
	[codDocumento] [int] NOT NULL,
	[rutArchivo] [int] NOT NULL,
	[tipDocumento] [int] NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_documentosadjuntostercero_codTercero] PRIMARY KEY CLUSTERED 
(
	[codTercero] ASC,
	[codDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gn_menu]    Script Date: 11/09/2016 5:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gn_menu](
	[codMenu] [int] NOT NULL,
	[nomMenu] [nvarchar](40) NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_menu_codMenu] PRIMARY KEY CLUSTERED 
(
	[codMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [gn_menu$codMenu_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gn_municipio]    Script Date: 11/09/2016 5:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gn_municipio](
	[codMunicipio] [int] IDENTITY(630,1) NOT NULL,
	[codDepartamento] [int] NOT NULL,
	[codSuip] [int] NOT NULL,
	[nomMunicipio] [nvarchar](30) NULL,
	[usuActividad] [nchar](15) NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_municipio_codMunicipio] PRIMARY KEY CLUSTERED 
(
	[codMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [gn_municipio$codPais_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gn_pais]    Script Date: 11/09/2016 5:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gn_pais](
	[codPais] [int] NOT NULL,
	[nomPais] [nvarchar](30) NULL,
	[usuActividad] [nchar](15) NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_pais_codPais] PRIMARY KEY CLUSTERED 
(
	[codPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [gn_pais$codPais_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gn_programassistema]    Script Date: 11/09/2016 5:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gn_programassistema](
	[codPrograma] [int] NOT NULL,
	[nomPrograma] [nvarchar](40) NOT NULL,
	[dirPrograma] [nvarchar](40) NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_programassistema_codPrograma] PRIMARY KEY CLUSTERED 
(
	[codPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [gn_programassistema$codProg_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gn_roles]    Script Date: 11/09/2016 5:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gn_roles](
	[codRol] [int] NOT NULL,
	[nomRol] [nvarchar](20) NOT NULL,
	[TipRol] [nchar](1) NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_roles_codRol] PRIMARY KEY CLUSTERED 
(
	[codRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [gn_roles$codRoll_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gn_tipodocumentosadjuntos]    Script Date: 11/09/2016 5:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gn_tipodocumentosadjuntos](
	[codTipDocumentos] [int] NOT NULL,
	[codPrograma] [int] NOT NULL,
	[nomDocumento] [int] NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_tipodocumentosadjuntos_codTipDocumentos] PRIMARY KEY CLUSTERED 
(
	[codTipDocumentos] ASC,
	[codPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gn_usuarios]    Script Date: 11/09/2016 5:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gn_usuarios](
	[codUsuaario] [nchar](15) NOT NULL,
	[desclave] [nchar](15) NOT NULL,
	[codTercero] [int] NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_usuarios_codUsuaario] PRIMARY KEY CLUSTERED 
(
	[codUsuaario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pe_asignacionpresupuesto]    Script Date: 11/09/2016 5:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pe_asignacionpresupuesto](
	[codPresupuesto] [int] NOT NULL,
	[anoPresupuesto] [int] NOT NULL,
	[valInicial] [float] NOT NULL,
	[valEjecutado] [float] NOT NULL,
	[valPendiente] [float] NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_pe_asignacionpresupuesto_codPresupuesto] PRIMARY KEY CLUSTERED 
(
	[codPresupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [pe_asignacionpresupuesto$codPres_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codPresupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pe_detallepresupuesto]    Script Date: 11/09/2016 5:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pe_detallepresupuesto](
	[codDetPresupuesto] [int] IDENTITY(132,1) NOT NULL,
	[codPresupuesto] [int] NOT NULL,
	[codFactura] [int] NOT NULL,
	[codProveedor] [int] NOT NULL,
	[codTomador] [int] NOT NULL,
	[valEmpresa] [float] NOT NULL,
	[usuActividad] [nvarchar](15) NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_pe_detallepresupuesto_codDetPresupuesto] PRIMARY KEY CLUSTERED 
(
	[codDetPresupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [pe_detallepresupuesto$codDpre_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codDetPresupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pr_facturacionproveedor]    Script Date: 11/09/2016 5:30:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pr_facturacionproveedor](
	[codFactura] [int] NOT NULL,
	[codServicio] [int] NOT NULL,
	[codProveedor] [int] NOT NULL,
	[valEmpleado] [float] NOT NULL,
	[valEmpresa] [float] NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_pr_facturacionproveedor_codFactura] PRIMARY KEY CLUSTERED 
(
	[codFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [pr_facturacionproveedor$codFact_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pr_valoresservicioproveedor]    Script Date: 11/09/2016 5:30:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pr_valoresservicioproveedor](
	[codValor] [int] NOT NULL,
	[codProveedor] [int] NOT NULL,
	[tipServicio] [int] NOT NULL,
	[observacion] [nvarchar](max) NULL,
	[fecFinVigencia] [date] NOT NULL,
	[valServicio] [float] NOT NULL,
	[usuActividad] [nchar](11) NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_pr_valoresservicioproveedor_codValor] PRIMARY KEY CLUSTERED 
(
	[codValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [pr_valoresservicioproveedor$codValo_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[be_solicitudbeneficios] ADD  DEFAULT ((0)) FOR [codProveedor]
GO
ALTER TABLE [dbo].[be_solicitudbeneficios] ADD  DEFAULT ((0)) FOR [codTomador]
GO
ALTER TABLE [dbo].[be_solicitudbeneficios] ADD  DEFAULT (N'0') FOR [estSolicitud]
GO
ALTER TABLE [dbo].[be_solicitudbeneficios] ADD  DEFAULT ((0)) FOR [codservicios]
GO
ALTER TABLE [dbo].[be_solicitudbeneficios] ADD  DEFAULT (N'0') FOR [observaciones]
GO
ALTER TABLE [dbo].[be_solicitudbeneficios] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[be_tipobeneficio] ADD  DEFAULT (NULL) FOR [indActividad]
GO
ALTER TABLE [dbo].[be_tipobeneficio] ADD  DEFAULT (NULL) FOR [afePrescipciones]
GO
ALTER TABLE [dbo].[be_tipobeneficio] ADD  DEFAULT (getdate()) FOR [actHora]
GO
ALTER TABLE [dbo].[be_tiposervicio] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[bi_beneficiariosempleados] ADD  DEFAULT (getdate()) FOR [actHora]
GO
ALTER TABLE [dbo].[bi_datosempleado] ADD  DEFAULT (getdate()) FOR [actHora]
GO
ALTER TABLE [dbo].[bi_datosproveedor] ADD  DEFAULT (getdate()) FOR [actHora]
GO
ALTER TABLE [dbo].[bi_datosterceros] ADD  DEFAULT (NULL) FOR [segNombre]
GO
ALTER TABLE [dbo].[bi_datosterceros] ADD  DEFAULT (NULL) FOR [segApellido]
GO
ALTER TABLE [dbo].[bi_datosterceros] ADD  DEFAULT (getdate()) FOR [actHora]
GO
ALTER TABLE [dbo].[gn_departamento] ADD  DEFAULT (NULL) FOR [nomDepartamento]
GO
ALTER TABLE [dbo].[gn_departamento] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[gn_detallemenu] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[gn_detallerol] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[gn_documentosadjuntostercero] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[gn_menu] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[gn_municipio] ADD  DEFAULT (NULL) FOR [nomMunicipio]
GO
ALTER TABLE [dbo].[gn_municipio] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[gn_pais] ADD  DEFAULT (NULL) FOR [nomPais]
GO
ALTER TABLE [dbo].[gn_pais] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[gn_programassistema] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[gn_roles] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[gn_tipodocumentosadjuntos] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[gn_usuarios] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[pe_asignacionpresupuesto] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[pe_detallepresupuesto] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[pr_facturacionproveedor] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[pr_valoresservicioproveedor] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[be_solicitudbeneficios]  WITH NOCHECK ADD  CONSTRAINT [be_solicitudbeneficios$FKproveedoress] FOREIGN KEY([codProveedor])
REFERENCES [dbo].[bi_datosproveedor] ([codProveedor])
GO
ALTER TABLE [dbo].[be_solicitudbeneficios] CHECK CONSTRAINT [be_solicitudbeneficios$FKproveedoress]
GO
ALTER TABLE [dbo].[be_solicitudbeneficios]  WITH NOCHECK ADD  CONSTRAINT [be_solicitudbeneficios$FKTERCE] FOREIGN KEY([codTomador])
REFERENCES [dbo].[bi_datosterceros] ([codTerc])
GO
ALTER TABLE [dbo].[be_solicitudbeneficios] CHECK CONSTRAINT [be_solicitudbeneficios$FKTERCE]
GO
ALTER TABLE [dbo].[be_tipobeneficio]  WITH NOCHECK ADD  CONSTRAINT [be_tipobeneficio$fkbetser] FOREIGN KEY([codTipServicio])
REFERENCES [dbo].[be_tiposervicio] ([codTipServicio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[be_tipobeneficio] CHECK CONSTRAINT [be_tipobeneficio$fkbetser]
GO
ALTER TABLE [dbo].[be_tipobeneficio]  WITH NOCHECK ADD  CONSTRAINT [be_tipobeneficio$fkprdatob] FOREIGN KEY([codProveedor])
REFERENCES [dbo].[bi_datosproveedor] ([codProveedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[be_tipobeneficio] CHECK CONSTRAINT [be_tipobeneficio$fkprdatob]
GO
ALTER TABLE [dbo].[bi_beneficiariosempleados]  WITH NOCHECK ADD  CONSTRAINT [bi_beneficiariosempleados$fkbiemple] FOREIGN KEY([codEmpleado])
REFERENCES [dbo].[bi_datosempleado] ([codEmpleado])
GO
ALTER TABLE [dbo].[bi_beneficiariosempleados] CHECK CONSTRAINT [bi_beneficiariosempleados$fkbiemple]
GO
ALTER TABLE [dbo].[bi_beneficiariosempleados]  WITH NOCHECK ADD  CONSTRAINT [bi_beneficiariosempleados$fkbiterce] FOREIGN KEY([codBeneficiario])
REFERENCES [dbo].[bi_datosterceros] ([codTerc])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bi_beneficiariosempleados] CHECK CONSTRAINT [bi_beneficiariosempleados$fkbiterce]
GO
ALTER TABLE [dbo].[bi_beneficiariosempleados]  WITH NOCHECK ADD  CONSTRAINT [bi_beneficiariosempleados$FKmuninaci] FOREIGN KEY([munNacimiento])
REFERENCES [dbo].[gn_municipio] ([codMunicipio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bi_beneficiariosempleados] CHECK CONSTRAINT [bi_beneficiariosempleados$FKmuninaci]
GO
ALTER TABLE [dbo].[bi_datosempleado]  WITH NOCHECK ADD  CONSTRAINT [bi_datosempleado$fk_biTerc] FOREIGN KEY([codEmpleado])
REFERENCES [dbo].[bi_datosterceros] ([codTerc])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bi_datosempleado] CHECK CONSTRAINT [bi_datosempleado$fk_biTerc]
GO
ALTER TABLE [dbo].[bi_datosempleado]  WITH NOCHECK ADD  CONSTRAINT [bi_datosempleado$FKmuni] FOREIGN KEY([munNacimiento])
REFERENCES [dbo].[gn_municipio] ([codMunicipio])
GO
ALTER TABLE [dbo].[bi_datosempleado] CHECK CONSTRAINT [bi_datosempleado$FKmuni]
GO
ALTER TABLE [dbo].[bi_datosproveedor]  WITH NOCHECK ADD  CONSTRAINT [bi_datosproveedor$FKtecer_prove] FOREIGN KEY([codProveedor])
REFERENCES [dbo].[bi_datosterceros] ([codTerc])
GO
ALTER TABLE [dbo].[bi_datosproveedor] CHECK CONSTRAINT [bi_datosproveedor$FKtecer_prove]
GO
ALTER TABLE [dbo].[bi_datosterceros]  WITH NOCHECK ADD  CONSTRAINT [bi_datosterceros$FKMUNITERC] FOREIGN KEY([codMunicipio])
REFERENCES [dbo].[gn_municipio] ([codMunicipio])
GO
ALTER TABLE [dbo].[bi_datosterceros] CHECK CONSTRAINT [bi_datosterceros$FKMUNITERC]
GO
ALTER TABLE [dbo].[gn_departamento]  WITH NOCHECK ADD  CONSTRAINT [gn_departamento$FKpais] FOREIGN KEY([codPais])
REFERENCES [dbo].[gn_pais] ([codPais])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[gn_departamento] CHECK CONSTRAINT [gn_departamento$FKpais]
GO
ALTER TABLE [dbo].[gn_detallemenu]  WITH NOCHECK ADD  CONSTRAINT [gn_detallemenu$fkmenu] FOREIGN KEY([codMenu])
REFERENCES [dbo].[gn_menu] ([codMenu])
GO
ALTER TABLE [dbo].[gn_detallemenu] CHECK CONSTRAINT [gn_detallemenu$fkmenu]
GO
ALTER TABLE [dbo].[gn_detallemenu]  WITH NOCHECK ADD  CONSTRAINT [gn_detallemenu$fkmenu1] FOREIGN KEY([codMenu])
REFERENCES [dbo].[gn_menu] ([codMenu])
GO
ALTER TABLE [dbo].[gn_detallemenu] CHECK CONSTRAINT [gn_detallemenu$fkmenu1]
GO
ALTER TABLE [dbo].[gn_detallemenu]  WITH NOCHECK ADD  CONSTRAINT [gn_detallemenu$fkprograma] FOREIGN KEY([codPrograma])
REFERENCES [dbo].[gn_programassistema] ([codPrograma])
GO
ALTER TABLE [dbo].[gn_detallemenu] CHECK CONSTRAINT [gn_detallemenu$fkprograma]
GO
ALTER TABLE [dbo].[gn_detallemenu]  WITH NOCHECK ADD  CONSTRAINT [gn_detallemenu$fkprograma1] FOREIGN KEY([codPrograma])
REFERENCES [dbo].[gn_programassistema] ([codPrograma])
GO
ALTER TABLE [dbo].[gn_detallemenu] CHECK CONSTRAINT [gn_detallemenu$fkprograma1]
GO
ALTER TABLE [dbo].[gn_detallemenu]  WITH NOCHECK ADD  CONSTRAINT [gn_detallemenu$fkroll] FOREIGN KEY([codRol])
REFERENCES [dbo].[gn_roles] ([codRol])
GO
ALTER TABLE [dbo].[gn_detallemenu] CHECK CONSTRAINT [gn_detallemenu$fkroll]
GO
ALTER TABLE [dbo].[gn_detallerol]  WITH NOCHECK ADD  CONSTRAINT [gn_detallerol$fkrol] FOREIGN KEY([codRol])
REFERENCES [dbo].[gn_roles] ([codRol])
GO
ALTER TABLE [dbo].[gn_detallerol] CHECK CONSTRAINT [gn_detallerol$fkrol]
GO
ALTER TABLE [dbo].[gn_detallerol]  WITH NOCHECK ADD  CONSTRAINT [gn_detallerol$fkusuar] FOREIGN KEY([codUsuario])
REFERENCES [dbo].[gn_usuarios] ([codUsuaario])
GO
ALTER TABLE [dbo].[gn_detallerol] CHECK CONSTRAINT [gn_detallerol$fkusuar]
GO
ALTER TABLE [dbo].[gn_documentosadjuntostercero]  WITH NOCHECK ADD  CONSTRAINT [gn_documentosadjuntostercero$fktercero] FOREIGN KEY([codTercero])
REFERENCES [dbo].[bi_datosterceros] ([codTerc])
GO
ALTER TABLE [dbo].[gn_documentosadjuntostercero] CHECK CONSTRAINT [gn_documentosadjuntostercero$fktercero]
GO
ALTER TABLE [dbo].[gn_tipodocumentosadjuntos]  WITH NOCHECK ADD  CONSTRAINT [gn_tipodocumentosadjuntos$fkprogramas] FOREIGN KEY([codPrograma])
REFERENCES [dbo].[gn_programassistema] ([codPrograma])
GO
ALTER TABLE [dbo].[gn_tipodocumentosadjuntos] CHECK CONSTRAINT [gn_tipodocumentosadjuntos$fkprogramas]
GO
ALTER TABLE [dbo].[pe_detallepresupuesto]  WITH NOCHECK ADD  CONSTRAINT [pe_detallepresupuesto$FK] FOREIGN KEY([codFactura])
REFERENCES [dbo].[pr_facturacionproveedor] ([codFactura])
GO
ALTER TABLE [dbo].[pe_detallepresupuesto] CHECK CONSTRAINT [pe_detallepresupuesto$FK]
GO
ALTER TABLE [dbo].[pe_detallepresupuesto]  WITH NOCHECK ADD  CONSTRAINT [pe_detallepresupuesto$FK4pres] FOREIGN KEY([codPresupuesto])
REFERENCES [dbo].[pe_asignacionpresupuesto] ([codPresupuesto])
GO
ALTER TABLE [dbo].[pe_detallepresupuesto] CHECK CONSTRAINT [pe_detallepresupuesto$FK4pres]
GO
ALTER TABLE [dbo].[pr_facturacionproveedor]  WITH NOCHECK ADD  CONSTRAINT [pr_facturacionproveedor$fkprov] FOREIGN KEY([codProveedor])
REFERENCES [dbo].[bi_datosproveedor] ([codProveedor])
GO
ALTER TABLE [dbo].[pr_facturacionproveedor] CHECK CONSTRAINT [pr_facturacionproveedor$fkprov]
GO
ALTER TABLE [dbo].[pr_valoresservicioproveedor]  WITH NOCHECK ADD  CONSTRAINT [pr_valoresservicioproveedor$FKproveedor] FOREIGN KEY([codProveedor])
REFERENCES [dbo].[bi_datosproveedor] ([codProveedor])
GO
ALTER TABLE [dbo].[pr_valoresservicioproveedor] CHECK CONSTRAINT [pr_valoresservicioproveedor$FKproveedor]
GO
ALTER TABLE [dbo].[pr_valoresservicioproveedor]  WITH NOCHECK ADD  CONSTRAINT [pr_valoresservicioproveedor$FKtservici] FOREIGN KEY([tipServicio])
REFERENCES [dbo].[be_tiposervicio] ([codTipServicio])
GO
ALTER TABLE [dbo].[pr_valoresservicioproveedor] CHECK CONSTRAINT [pr_valoresservicioproveedor$FKtservici]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.be_solicitudbeneficios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'be_solicitudbeneficios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.be_tipobeneficio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'be_tipobeneficio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.be_tiposervicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'be_tiposervicio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.bi_beneficiariosempleados' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bi_beneficiariosempleados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.bi_datosempleado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bi_datosempleado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.bi_datosproveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bi_datosproveedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.bi_datosterceros' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bi_datosterceros'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_departamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gn_departamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_detallemenu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gn_detallemenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_detallerol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gn_detallerol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_documentosadjuntostercero' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gn_documentosadjuntostercero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_menu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gn_menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_municipio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gn_municipio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_pais' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gn_pais'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_programassistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gn_programassistema'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_roles' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gn_roles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_tipodocumentosadjuntos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gn_tipodocumentosadjuntos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_usuarios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gn_usuarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.pe_asignacionpresupuesto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pe_asignacionpresupuesto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.pe_detallepresupuesto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pe_detallepresupuesto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.pr_facturacionproveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pr_facturacionproveedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.pr_valoresservicioproveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pr_valoresservicioproveedor'
GO
