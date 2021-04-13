﻿<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/*">
    <xsl:if test="name(.) != 'Table' ">
      <font color="red">本模板只能用于单表</font>
      <br />
    </xsl:if>
    <xsl:variable name="classname">
      <xsl:value-of select="concat(NameDx,'Info')" />
    </xsl:variable>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Chloe.Entity;

namespace Gdky.Entities
{
  ///<summary>
  /// <xsl:value-of select="Name" />实体类
  ///</summary>
  [Table("<xsl:value-of select="Name" />")]
  public class <xsl:value-of select="NameDx" />
  {
    ///<summary>
    ///返回数据表名称 <xsl:value-of select="Name" />
    ///</summary>
    public <xsl:value-of select="NameDx" />()
    {
    }

    #region 定义数据库字段变量及属性
    <xsl:for-each select="Fields/Field">
      <!-- 定义默认值 -->
      <xsl:variable name="defaultvalue">
        <xsl:choose>
          <xsl:when test="DefaultValue='CURRENT_TIMESTAMP'">Convert.ToDateTime(DateTime.Now)</xsl:when>
          <xsl:otherwise><xsl:value-of select="DefaultValue" /></xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
    private <xsl:value-of select="ValueTypeName" /><xsl:if test="Nullable = 'true' and ValueTypeName != 'string' and ValueTypeName != 'bool'">?</xsl:if><xsl:text> </xsl:text>_<xsl:value-of select="LcName" /><xsl:if test="DefaultVal != ''">=<xsl:value-of select="$defaultvalue" /></xsl:if>;</xsl:for-each>
     <xsl:text>
     </xsl:text>
    //[ColumnAttribute("", IsPrimaryKey = true)]
    //[NonAutoIncrementAttribute]
    [Column(IsPrimaryKey = true)]
   <xsl:for-each select="Fields/Field">
    <xsl:variable name="remark">
      <xsl:if test="string-length( Remark ) > 0 ">
        (<xsl:value-of select="Remark" />)
      </xsl:if>
    </xsl:variable>
    ///<summary>
    /// <xsl:value-of select="Description" />
    ///</summary>
    public <xsl:value-of select="ValueTypeName" />
    <xsl:if test="Nullable = 'true' and ValueTypeName != 'string' and ValueTypeName != 'bool'">?</xsl:if><xsl:text> </xsl:text><xsl:value-of select="Name" />
    {
        get{ return _<xsl:value-of select="LcName" />;}
        set{ _<xsl:value-of select="LcName" /> = value;}
    }</xsl:for-each>
   #endregion
  }
}
  </xsl:template>
</xsl:stylesheet>

