﻿<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="xml" indent="yes" />
  <xsl:template match="/*">
    <xsl:for-each select="//Table">
      <xsl:call-template name="table" />
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="table">
    <xsl:variable name="Num1">
      <xsl:for-each select="Fields/Field">
        <xsl:if test="IsIdentity='true'">
          <xsl:value-of select="ID" />
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="Num2">
      <xsl:for-each select="Fields/Field">
        <xsl:if test="PrimaryKey='true'">
          <xsl:value-of select="ID" />
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="Num">
      <xsl:if test="$Num1!='' and $Num2=''">
        <xsl:value-of select="$Num1" />
      </xsl:if>
      <xsl:if test="$Num1='' and $Num2!=''">
        <xsl:value-of select="$Num2" />
      </xsl:if>
      <xsl:if test="$Num1!='' and $Num2!=''">
        <xsl:if test="$Num1>$Num2">
          <xsl:value-of select="$Num1" />
        </xsl:if>
        <xsl:if test="$Num2>$Num1">
          <xsl:value-of select="$Num2" />
        </xsl:if>
        <xsl:if test="$Num1=$Num2">
          <xsl:value-of select="$Num1" />
        </xsl:if>
      </xsl:if>
    </xsl:variable>
    <xsl:variable name="strWhere">
      <xsl:for-each select="Fields/Field">
        <xsl:if test="IsIdentity='true' or PrimaryKey='true'">
          <xsl:text disable-output-escaping="yes"></xsl:text><xsl:value-of select="ValueTypeName" />
          <xsl:text> </xsl:text><xsl:value-of select="Name" />
          <xsl:if test="ID != $Num"> , </xsl:if>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
using System;
using System.Collections.Generic;
using System.Data;

namespace Maticsoft.Interface_<xsl:value-of select="Name" />
{
  /// <summary>
  /// 接口I<xsl:value-of select="Name" />
  ///</summary>
  public interface I<xsl:value-of select="Name" />
  {
    #region  成员方法
    /// <summary>
    /// 增加一条数据
    ///</summary>
    int Add<xsl:value-of select="Name" />(<xsl:value-of select="Name" />Info info);
    /// <summary>
    /// 更新一条数据
    ///</summary>
    int Edit<xsl:value-of select="Name" />(<xsl:value-of select="Name" />Info info);
    /// <summary>
    /// 删除一条数据
    ///</summary>
    int Del<xsl:value-of select="Name" />(<xsl:value-of select="$strWhere" />);
    /// <summary>
    /// 得到一个对象实体
    ///</summary>
    DataSet Get<xsl:value-of select="Name" />GetModel(<xsl:value-of select="$strWhere" />);
    <xsl:value-of select="Name" />Info Get<xsl:value-of select="Name" />GetModel(<xsl:value-of select="$strWhere" />);
    /// <summary>
    /// 获得数据列表
    ///</summary>
    DataSet Get<xsl:value-of select="Name" />List();
    IList&lt;<xsl:value-of select="Name" />Info&gt; Get<xsl:value-of select="Name" />List();
    /// <summary>
    /// 根据分页获得数据列表
    ///</summary>
    DataSet Get<xsl:value-of select="Name" />List(int PageSize,int PageIndex,string strWhere);
    #endregion  成员方法
    }
    }

  </xsl:template>
</xsl:stylesheet>

